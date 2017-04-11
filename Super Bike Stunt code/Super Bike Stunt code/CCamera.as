class CCamera
{
    function CCamera()
    {
    } // End of the function
    function init(targetMovie_, levelMovie_)
    {
        var _loc2 = this;
        _loc2.targetMovie = targetMovie_;
        _loc2.levelMovie = levelMovie_;
        _loc2.process();
    } // End of the function
    function process()
    {
        var _loc2 = this;
        var _loc3 = {x: _loc2.targetMovie._x, y: _loc2.targetMovie._y};
        _loc2.targetMovie._parent.localToGlobal(_loc3);
        _loc2.levelMovie._parent.globalToLocal(_loc3);
        _loc2.levelMovie._x = _loc2.levelMovie._x + (CCamera.SCREEN_WIDTH2 - _loc3.x);
        _loc2.levelMovie._y = _loc2.levelMovie._y + (CCamera.SCREEN_HEIGHT2 - _loc3.y);
        _loc2.levelMovie._x = Math.round(_loc2.levelMovie._x);
        _loc2.levelMovie._y = Math.round(_loc2.levelMovie._y);
        if (_loc2.levelMovie._x > 0)
        {
            _loc2.levelMovie._x = 0;
        }
        else if (_loc2.levelMovie._x + _loc2.levelMovie._width < CCamera.SCREEN_WIDTH)
        {
            _loc2.levelMovie._x = CCamera.SCREEN_WIDTH - _loc2.levelMovie._width;
        } // end else if
        if (_loc2.levelMovie._y < 0)
        {
            _loc2.levelMovie._y = 0;
        } // end if
    } // End of the function
    static var SCREEN_WIDTH = 500;
    static var SCREEN_HEIGHT = 400;
    static var SCREEN_WIDTH2 = CCamera.SCREEN_WIDTH / 2;
    static var SCREEN_HEIGHT2 = CCamera.SCREEN_HEIGHT / 2;
} // End of Class
