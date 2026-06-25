/// @description Camera Controller Constructor
function CameraController(_target, _view_w, _view_h) constructor {
	target = _target;
	cam = view_camera[0];
	last_trigger_zone = undefined;
	camera_data = {
		x: 0,
		y: 0,
		base_view_w: _view_w,
		base_view_h: _view_h,
		w: _view_w,
		h: _view_h,
		zoom: 1.0,
		zoom_target: 1.0,
		offset_x: 0,
		offset_y: 0,
		target_offset_x: 0,
		target_offset_y: 0,
		lock_x: false,
		lock_y: false,
		last_cam_x: 0,
		last_cam_y: 0
	}

	// Camera stats
	center_phase = CENTERING_PHASE.FREE;
	enum CENTERING_PHASE {
		FREE = 0,
		CENTERING = 1
	}

	// Smoothing
	lerp_speed = 0.1;
	speed_mult = 1.0;
	zoom_speed = 0.05;
	center_threshold = 8;

	// Pending settings – deposited by any trigger that wants "center first"
	pending_camera_data = {
		active: false,
		lock_x: false,
		lock_y: false,
		zoom: -1,   // -1 = no zoom change queued
		zoom_spd: 0.05,
		offset_x: 0,
		offset_y: 0,
		offset: false // true = apply offset when centering finishes
	};

	static debug = function(_x, _y)
	{
		// Draw debug info about the camera to the screen
		draw_set_color(c_white);
		draw_text(_x, _y, $"Camera Debug:");
		draw_text(_x, _y + 16, $"Camera State: {center_phase}");
		draw_text(_x, _y + 32, $"Position: {camera_data.x}, {camera_data.y}");
		draw_text(_x, _y + 48, $"Target: {target.x + camera_data.offset_x}, {target.y + camera_data.offset_y}");
		draw_text(_x, _y + 64, $"Size: {camera_data.w}, {camera_data.h}");
		draw_text(_x, _y + 80, $"Zoom: {camera_data.zoom}");
		draw_text(_x, _y + 96, $"Target Zoom: {camera_data.zoom_target}");
		draw_text(_x, _y + 112, $"Offset: {camera_data.offset_x}, {camera_data.offset_y}");
		draw_text(_x, _y + 128, $"Target Offset: {camera_data.target_offset_x}, {camera_data.target_offset_y}");
		draw_text(_x, _y + 144, $"Lock X: {camera_data.lock_x}, Lock Y: {camera_data.lock_y}");

		// Pending camera settings if any
		draw_set_color(c_yellow);
		if (pending_camera_data.active) {
			draw_text(_x, _y + 160, $"Pending Settings:");
			draw_text(_x, _y + 176, $"Lock X: {pending_camera_data.lock_x}, Lock Y: {pending_camera_data.lock_y}");
			draw_text(_x, _y + 192, $"Zoom: {pending_camera_data.zoom}");
			draw_text(_x, _y + 208, $"Offset: {pending_camera_data.offset_x}, {pending_camera_data.offset_y}");
		}
	}

	/// @description Update the camera each step. Call from a Step event.
	static update = function() {
		if (!instance_exists(target))
			exit;

		// --- Zoom smoothing
		if (camera_data.zoom != camera_data.zoom_target) {
			camera_data.zoom = lerp(camera_data.zoom, camera_data.zoom_target, zoom_speed * speed_mult);
			if (abs(camera_data.zoom - camera_data.zoom_target) < 0.001) camera_data.zoom = camera_data.zoom_target;
			camera_data.w = camera_data.base_view_w * camera_data.zoom;
			camera_data.h = camera_data.base_view_h * camera_data.zoom;
		}

		var tx = target.x + camera_data.offset_x;
		var ty = target.y + camera_data.offset_y;

		// Desired top-left so the target is centred in the view
		var desired_x = tx - (camera_data.w * 0.5);
		var desired_y = ty - (camera_data.h * 0.5);

		// --- Centering phase
		if (center_phase == CENTERING_PHASE.CENTERING) {
			// Move freely toward the player ignoring any locks
			camera_data.x = lerp(camera_data.x, desired_x, lerp_speed * speed_mult);
			camera_data.y = lerp(camera_data.y, desired_y, lerp_speed * speed_mult);

			// If the target is too close to the room edge, we cannot center on it so consider it "centered" and apply the pending settings immediately.
			var is_player_on_edge_x = (tx < camera_data.w * 0.5 || tx > room_width - camera_data.w * 0.5)
			var is_player_on_edge_y = (ty < camera_data.h * 0.5 || ty > room_height - camera_data.h * 0.5);
			var x_distance = abs(camera_data.x - desired_x);
			var y_distance = abs(camera_data.y - desired_y);
			if ((x_distance < center_threshold || is_player_on_edge_x) && (y_distance < center_threshold || is_player_on_edge_y)) {
				// Apply any pending settings that were queued
				if (pending_camera_data.active) {
					pending_camera_data.active = false;
					lock_x = pending_camera_data.lock_x;
					lock_y = pending_camera_data.lock_y;
					if (pending_camera_data.zoom >= 0)
						zoom_to(pending_camera_data.zoom, pending_camera_data.zoom_spd);
					if (pending_camera_data.offset)
						set_offset(pending_camera_data.offset_x, pending_camera_data.offset_y);
				}

				center_phase = CENTERING_PHASE.FREE;
			}
		} else {
			// Normal smooth follow with axis locking
			if (!lock_x)
				camera_data.x = lerp(camera_data.x, desired_x, lerp_speed * speed_mult);

			if (!lock_y)
				camera_data.y = lerp(camera_data.y, desired_y, lerp_speed * speed_mult);
		}

		// Clamp to room bounds
		camera_data.x = clamp(camera_data.x, 0, max(0, room_width  - camera_data.w));
		camera_data.y = clamp(camera_data.y, 0, max(0, room_height - camera_data.h));

		// Apply to GameMaker camera
		var expected_x = camera_data.x;
		var expected_y = camera_data.y;

		camera_set_view_pos(cam, expected_x, expected_y);
		camera_set_view_size(cam, camera_data.w, camera_data.h);

		camera_data.last_cam_x = expected_x;
		camera_data.last_cam_y = expected_y;
	};

	/// @description Begin freely tracking to the player. Any pending settings already queued will be applied once centred.
	/// @param {Real} _threshold Optionally pass a threshold in pixels (default 0.5).
	static begin_centering = function(_threshold = 0.5) {
		center_threshold = _threshold;
		center_phase = CENTERING_PHASE.CENTERING;
		// Release locks so we can pan freely during the tracking phase
		lock_x = false;
		lock_y = false;
	};

	/// @description Triggers the camera to center on the player with a specified offset, then apply locks and zoom if desired.
	/// @param {Real} _offset_x View offset X to apply after centering
	/// @param {Real} _offset_y View offset Y to apply after centering

	static center_with_offset_then_apply = function(_offset_x, _offset_y,
        _lock_x = false, _lock_y = false, _zoom = -1, _zoom_spd = 0.05, _poff_x = 0, _poff_y = 0, _threshold = center_threshold) {
		set_offset(_offset_x, _offset_y);
		center_then_apply(_lock_x, _lock_y, _zoom, _zoom_spd, _poff_x, _poff_y, true, _threshold);
	};

	/// @description Triggers the camera to center on the player, then apply axis locks and a view offset after centering completes.
	/// @param {Bool} _lock_x Lock X after centering?
	/// @param {Bool} _lock_y Lock Y after centering?
	/// @param {Real} _zoom Optional Zoom level to apply after centering (-1 = no change)
	/// @param {Real} _zoom_spd Optional Zoom lerp speed for the zoom change
	/// @param {Real} _poff_x Optional additional pixel offset X to apply after centering (overwrites  any previous offset)
	/// @param {Real} _poff_y Optional additional pixel offset Y to apply after centering (overwrites any previous offset)
	/// @param {Real} _threshold Optional Pixel distance that counts as "centered"
	static center_then_apply = function(
		_lock_x = false, _lock_y = false, _zoom = -1, _zoom_spd = 0.05, _offset_x = 0, _offset_y = 0, _threshold = center_threshold) {
		// Queue settings
		pending_camera_data.lock_x = _lock_x;
		pending_camera_data.lock_y = _lock_y;
		pending_camera_data.zoom = _zoom;
		pending_camera_data.zoom_spd = _zoom_spd;
		pending_camera_data.offset_x = _offset_x;
		pending_camera_data.offset_y = _offset_y;
		pending_camera_data.offset = _offset_x != 0 || _offset_y != 0;
		pending_camera_data.active = true;

		// Start the centering phase
		begin_centering(_threshold);
	};

	/// @description True once centering has finished (phase is no longer 1).
	static is_centering = function() {
		return (center_phase == CENTERING_PHASE.CENTERING);
	};

	/// @description Cancel centering and apply any pending settings immediately.
	static cancel_centering = function() {
		if (pending_camera_data.active) {
			pending_camera_data.active = false;
			camera_data.lock_x = pending_camera_data.lock_x;
			camera_data.lock_y = pending_camera_data.lock_y;
			if (pending_camera_data.zoom >= 0)
				zoom_to(pending_camera_data.zoom, pending_camera_data.zoom_spd);
			if (pending_camera_data.offset)
				set_offset(pending_camera_data.offset_x, pending_camera_data.offset_y);
		}

		center_phase = CENTERING_PHASE.FREE;
	};

	/// @description Clear any queued pending settings without applying them.
	static clear_pending = function() {
		pending_camera_data.active = false;
		pending_camera_data.zoom   = -1;
		pending_camera_data.offset = false;
	};

	static set_lock_x = function(_state) { camera_data.lock_x = _state; };
	static set_lock_y = function(_state) { camera_data.lock_y = _state; };
	static lock_all   = function() { camera_data.lock_x = true;  camera_data.lock_y = true;  };
	static unlock_all = function() { camera_data.lock_x = false; camera_data.lock_y = false; };

	/// @description Set the world-space offset applied after centering the target.
	static set_offset = function(_ox, _oy) {
		camera_data.offset_x = _ox;
		camera_data.offset_y = _oy;
		camera_data.target_offset_x = _ox;
		camera_data.target_offset_y = _oy;
	};

	/// @description Lerp toward a target offset each step. Returns true when arrived.
	static lerp_offset = function(_ox, _oy) {
		camera_data.target_offset_x = _ox;
		camera_data.target_offset_y = _oy;
	};

	/// @description Smoothly zoom to _level (1.0 normal, <1 in, >1 out).
	static zoom_to = function(_level, _spd = 0.05) {
		camera_data.zoom_target = _level;
		camera_data.zoom_speed  = _spd;
	};

	/// @description Snap zoom instantly.
	static zoom_snap = function(_level) {
		camera_data.zoom = camera_data.zoom_target = _level;
		camera_data.w = camera_data.base_view_w * camera_data.zoom;
		camera_data.h = camera_data.base_view_h * camera_data.zoom;
	};

	static zoom_reset = function() { zoom_to(1.0); };
	static clear_offset = function() { set_offset(0, 0); };
	static set_target     = function(_t) { target = _t; };
	static set_lerp_speed = function(_spd) { lerp_speed = clamp(_spd, 0.001, 1.0); };
	static reset_all = function()
	{
		unlock_all();
		zoom_to(1.0, 0.05);
		clear_offset();
	}

	/// @desc Snap the camera to the target with no lerp.
	static snap_to_target = function() {
		if (!instance_exists(target))
			exit;
		camera_data.x = target.x - camera_data.w * 0.5 + camera_data.offset_x;
		camera_data.y = target.y - camera_data.h * 0.5 + camera_data.offset_y;
	};
}