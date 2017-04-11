class CMan extends MovieClip
{
    var stopFlag, state, mc;
    function CMan()
    {
        super();
        stopFlag = false;
        state = 0;
    } // End of the function
    function stopAnim()
    {
        stopFlag = true;
    } // End of the function
    function stopMCAnim()
    {
        mc.stop();
    } // End of the function
    function startAnim()
    {
        stopFlag = false;
    } // End of the function
    function onEnterFrame()
    {
        var _loc2 = this;
        if (_loc2.stopFlag)
        {
            return;
        } // end if
        if (Key.isDown(CMan.LEFT_BUTTON))
        {
            _loc2.toLeft();
            return;
        } // end if
        if (Key.isDown(CMan.RIGHT_BUTTON))
        {
            _loc2.toRight();
            return;
        } // end if
        if (_loc2.state == 1 || _loc2.state == 2)
        {
            _loc2.fromLeft();
            return;
        } // end if
        if (_loc2.state == 4 || _loc2.state == 5)
        {
            _loc2.fromRight();
        } // end if
    } // End of the function
    function toLeft()
    {
        var _loc2 = this;
        var _loc3;
        if (_loc2.state == 0)
        {
            _loc2.state = 1;
            _loc2.gotoAndStop("toLeft");
            _loc2.state = 1;
            return;
        } // end if
        if (_loc2.state == 3)
        {
            _loc3 = _loc2.mc._currentframe;
            _loc2.gotoAndStop("toLeft");
            _loc2.mc.gotoAndPlay(CMan.ANIM_FRAMES - _loc3 + 1);
            _loc2.state = 1;
            return;
        } // end if
        if (_loc2.state == 4 || _loc2.state == 5)
        {
            _loc2.fromRight();
            _loc2.state = 6;
        } // end if
    } // End of the function
    function toRight()
    {
        var _loc2 = this;
        var _loc3;
        if (_loc2.state == 0)
        {
            _loc2.state = 1;
            _loc2.gotoAndStop("toRight");
            _loc2.state = 4;
            return;
        } // end if
        if (_loc2.state == 6)
        {
            _loc3 = _loc2.mc._currentframe;
            _loc2.gotoAndStop("toRight");
            _loc2.mc.gotoAndPlay(CMan.ANIM_FRAMES - _loc3 + 1);
            _loc2.state = 4;
            return;
        } // end if
        if (_loc2.state == 1 || _loc2.state == 2)
        {
            _loc2.fromLeft();
            _loc2.state = 3;
        } // end if
    } // End of the function
    function fromLeft()
    {
        var _loc2 = this;
        var _loc3;
        if (_loc2.state == 1)
        {
            _loc3 = _loc2.mc._currentframe;
            _loc2.gotoAndStop("fromLeft");
            _loc2.mc.gotoAndPlay(CMan.ANIM_FRAMES - _loc3 + 1);
            _loc2.state = 3;
            return;
        } // end if
        if (_loc2.state == 2)
        {
            _loc2.gotoAndStop("fromLeft");
            _loc2.state = 3;
        } // end if
    } // End of the function
    function fromRight()
    {
        var _loc2 = this;
        var _loc3;
        if (_loc2.state == 4)
        {
            _loc3 = _loc2.mc._currentframe;
            _loc2.gotoAndStop("fromRight");
            _loc2.mc.gotoAndPlay(CMan.ANIM_FRAMES - _loc3 + 1);
            _loc2.state = 6;
            return;
        } // end if
        if (_loc2.state == 5)
        {
            _loc2.gotoAndStop("fromRight");
            _loc2.state = 6;
        } // end if
    } // End of the function
    function endMove()
    {
        var _loc2 = this;
        if (_loc2.state == 1)
        {
            _loc2.gotoAndStop("left");
            _loc2.state = 2;
            return;
        } // end if
        if (_loc2.state == 3)
        {
            _loc2.state = 0;
            _loc2.gotoAndStop("stay");
            return;
        } // end if
        if (_loc2.state == 4)
        {
            _loc2.state = 5;
            _loc2.gotoAndStop("right");
            return;
        } // end if
        if (_loc2.state == 6)
        {
            _loc2.state = 0;
            _loc2.gotoAndStop("stay");
        } // end if
    } // End of the function
    static var LEFT_BUTTON = 37;
    static var RIGHT_BUTTON = 39;
    static var ANIM_FRAMES = 7;
} // End of Class
