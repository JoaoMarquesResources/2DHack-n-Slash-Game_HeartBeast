/// @description desc
if (instance_exists(o_Camera))
{
	layer_x("CloseGraveBackground", o_Camera.x / 2.5);
	layer_x("FarGraveBackground", o_Camera.x / 1.8);
	layer_x("CloudsBackground", o_Camera.x / 1.2);
}
else exit;