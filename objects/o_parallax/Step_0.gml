/// @description desc
if (instance_exists(o_skeleton))
{
	layer_x("CloseGraveBackground", o_skeleton.x / 2.5);
	layer_x("FarGraveBackground", o_skeleton.x / 1.8);
	layer_x("CloudsBackground", o_skeleton.x / 1.2);
}
else exit;