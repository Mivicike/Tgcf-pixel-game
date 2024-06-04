//Resize Grid
var dgrid = ds_depthgrid;
var inst_num = instance_number(per_depthObject);
ds_grid_resize(dgrid,2,inst_num);

//Add instance information to the grid

var yy = 0; with(per_depthObject){
	dgrid[# 0 , yy] =  id;
	dgrid[# 1, yy] = y;
	yy++;
}

//Sort grid in ascending order
ds_grid_sort(dgrid,1,true);

//Loop through the grid and draw all the instances
var inst;
yy = 0; repeat(inst_num){
	//pull out an ID
	inst = dgrid[# 0, yy];
	//get instance to draw itself
	with(inst){
		draw_self();
	}
	
	yy++;
}