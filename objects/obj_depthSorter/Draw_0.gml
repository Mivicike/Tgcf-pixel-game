//Resize Grid
var _drid = ds_depthgrid;
var _inst_num = instance_number(per_depthObject);
ds_grid_resize(_drid,2,_inst_num);

//Add instance information to the grid

var _yy = 0; with(per_depthObject){
	_drid[# 0 , _yy] =  id;
	_drid[# 1, _yy] = y;
	_yy++;
}

//Sort grid in ascending order
ds_grid_sort(_drid,1,true);

//Loop through the grid and draw all the instances
var _inst;
_yy = 0; repeat(_inst_num){
	//pull out an ID
	_inst = _drid[# 0, _yy];
	//get instance to draw itself
	with(_inst){
		draw_self();
	}
	
	_yy++;
}