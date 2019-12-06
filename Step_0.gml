/// @description Player Events
///Get Input
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
jump = keyboard_check_pressed(vk_space);

///Calculate Movement
var move = right - left;
hsp = move * walkspd;

vsp = vsp + grav;

if (place_meeting(x,y+1,obj_wall)) and (jump)
{
	vsp = -4;
}
	
///Horizontal Code
if place_meeting(x+hsp,y,obj_wall)
{
	while(!place_meeting(x + sign(hsp),y,obj_wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

///Vertiacl Code
if place_meeting(x,y+vsp,obj_wall)
{
	while(!place_meeting(x,y + sign(vsp),obj_wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

///Calulate Player Status
onground = place_meeting(x,y+1,obj_wall);
onwall = place_meeting(x+1,y,obj_wall) - place_meeting(x-1,y,obj_wall);

//Animation
if (!onground)
{
		if (hsp != 0) image_xscale = sign(hsp);
		sprite_index = Spr_Zero_Jumping;
		image_speed = animation_speed / 4;
		if (sign(vsp) > 0) image_index = 0 and image_speed = animation_speed; else image_index = 7 and image_speed = animation_speed / 4;	

}


if (onground)
{
	if (hsp != 0) image_xscale = sign(hsp);
	image_speed = animation_speed / 4;
	if(hsp != 0) sprite_index = Spr_Zero_Running; else sprite_index = Spr_Zero_Idle
}
