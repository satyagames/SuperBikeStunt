class CBikeSynchronizer
{
    function CBikeSynchronizer()
    {
        var _loc2 = this;
        _loc2.fdir = new CVector2D(0, 0);
        _loc2.fpos = new CVector2D(0, 0);
        _loc2.bdir = new CVector2D(0, 0);
        _loc2.bpos = new CVector2D(0, 0);
    } // End of the function
    function init(mc_container, sX, sY)
    {
        var _loc2 = this;
        var _loc4 = mc_container;
        var _loc3 = {x: 0, y: 0};
        _loc2.mc_back_wheel = _loc4.attachMovie("lib_back_wheel", "back_w", 2);
        _loc2.mc_forward_wheel = _loc4.attachMovie("lib_forward_wheel", "forward_w", 1);
        _loc2.mc_bike = _loc4.attachMovie("lib_bike_body", "body", 0);
        _loc2.mc_bike._x = sX;
        _loc2.mc_bike._y = sY;
        _loc3.x = _loc2.mc_bike.mc.mc_s_wheel_back._x;
        _loc3.y = _loc2.mc_bike.mc.mc_s_wheel_back._y;
        _loc2.mc_bike.mc.localToGlobal(_loc3);
        _loc2.mc_bike._parent.globalToLocal(_loc3);
        _loc2.mc_back_wheel._x = _loc3.x;
        _loc2.mc_back_wheel._y = _loc3.y;
        _loc3.x = _loc2.mc_bike.mc.mc_s_wheel_forward._x;
        _loc3.y = _loc2.mc_bike.mc.mc_s_wheel_forward._y;
        _loc2.mc_bike.mc.localToGlobal(_loc3);
        _loc2.mc_bike._parent.globalToLocal(_loc3);
        _loc2.mc_forward_wheel._x = _loc3.x;
        _loc2.mc_forward_wheel._y = _loc3.y;
    } // End of the function
    function setParticles(pBody_, pBWheel_, pFWheel_)
    {
        var _loc2 = this;
        _loc2.pBody = pBody_;
        _loc2.pBWheel = pBWheel_;
        _loc2.pFWheel = pFWheel_;
        _loc2.fdir.reinit(_loc2.mc_bike.mc.mc_f_point._x - _loc2.mc_bike.mc.mc_s_wheel_forward._x, _loc2.mc_bike.mc.mc_f_point._y - _loc2.mc_bike.mc.mc_s_wheel_forward._y);
        _loc2.fdir.normalize();
        _loc2.fpos.x = _loc2.mc_bike.mc.mc_f_spring._x + _loc2.fdir.x * -_loc2.mc_bike.mc.mc_f_spring._y / _loc2.fdir.y;
        _loc2.fpos.x = _loc2.fpos.x - _loc2.mc_bike.mc.mc_body_man._x;
        _loc2.bpos.reinit(_loc2.mc_bike.mc.mc_b_spring.mc_top._x, _loc2.mc_bike.mc.mc_b_spring.mc_top._y);
        _loc2.mc_bike.mc.mc_b_spring.localToGlobal(_loc2.bpos);
        _loc2.bdir.reinit(_loc2.bpos.x, _loc2.bpos.y);
        _loc2.mc_bike.mc.mc_body_man.globalToLocal(_loc2.bpos);
        _loc2.mc_bike.mc.globalToLocal(_loc2.bdir);
        _loc2.bdir.x = _loc2.bdir.x - _loc2.mc_bike.mc.mc_b_spring._x;
        _loc2.bdir.y = _loc2.bdir.y - _loc2.mc_bike.mc.mc_b_spring._y;
    } // End of the function
    function process()
    {
        var _loc2 = this;
        var _loc3 = {x: 0, y: 0};
        var _loc4;
        _loc2.mc_bike._x = _loc2.pBody.pos.x;
        _loc2.mc_bike._y = _loc2.pBody.pos.y;
        _loc4 = _loc2.pFWheel.pos.minusNew(_loc2.pBWheel.pos);
        _loc2.mc_bike._rotation = Math.atan2(_loc4.y, _loc4.x) * 180 / 3.141593;
        _loc3.x = _loc2.pFWheel.pos.x;
        _loc3.y = _loc2.pFWheel.pos.y;
        _loc2.mc_bike._parent.localToGlobal(_loc3);
        _loc2.mc_bike.mc.globalToLocal(_loc3);
        _loc2.mc_bike.mc.mc_f_spring._x = _loc3.x;
        _loc2.mc_bike.mc.mc_f_spring._y = _loc3.y;
        var _loc5 = _loc3.x + _loc2.fdir.x * -_loc3.y / _loc2.fdir.y - _loc2.mc_bike.mc.mc_body_man._x - _loc2.fpos.x;
        _loc2.mc_bike.mc.mc_body_man._x = _loc2.mc_bike.mc.mc_body_man._x + _loc5;
        _loc3.x = _loc2.mc_bike.mc.mc_f_spring.mc_spring._x;
        _loc3.y = _loc2.mc_bike.mc.mc_f_spring.mc_spring._y;
        _loc2.mc_bike.mc.mc_f_spring.localToGlobal(_loc3);
        _loc2.mc_bike.mc.globalToLocal(_loc3);
        _loc3.x = _loc2.pBWheel.pos.x;
        _loc3.y = _loc2.pBWheel.pos.y;
        _loc2.mc_bike._parent.localToGlobal(_loc3);
        _loc2.mc_bike.mc.globalToLocal(_loc3);
        _loc2.mc_bike.mc.mc_b_spring._x = _loc3.x;
        _loc2.mc_bike.mc.mc_b_spring._y = _loc3.y;
        _loc4.reinit(_loc2.bpos.x, _loc2.bpos.y);
        _loc2.mc_bike.mc.mc_body_man.localToGlobal(_loc4);
        _loc2.mc_bike.mc.globalToLocal(_loc4);
        _loc4.x = _loc4.x - _loc2.mc_bike.mc.mc_b_spring._x;
        _loc4.y = _loc4.y - _loc2.mc_bike.mc.mc_b_spring._y;
        _loc2.mc_bike.mc.mc_b_spring._rotation = (_loc4.getUgol() - _loc2.bdir.getUgol()) * 180 / 3.141593;
    } // End of the function
} // End of Class
