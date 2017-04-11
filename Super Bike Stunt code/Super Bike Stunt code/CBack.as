class CBack
{
    function CBack()
    {
    } // End of the function
    function init(mc1_, mc2_, scaleFactor_)
    {
        var _loc2 = this;
        _loc2.mc1 = mc1_;
        _loc2.mc2 = mc2_;
        _loc2.scaleFactor = scaleFactor_;
    } // End of the function
    function process(levelX)
    {
        var _loc2 = this;
        var _loc3 = levelX;
        _loc3 = Math.abs(Math.round(_loc3) / _loc2.scaleFactor) % _loc2.mc1._width;
        _loc2.mc1._x = -_loc3;
        _loc2.mc2._x = _loc2.mc1._x + _loc2.mc1._width - 1;
    } // End of the function
    static var SCREEN_WIDTH = 500;
} // End of Class
