class CParticle
{
    function CParticle(x_, y_, mass_)
    {
        var _loc2 = this;
        _loc2.pos = new CVector2D(x_, y_);
        _loc2.prevPos = _loc2.pos.duplicate();
        _loc2.mass = mass_;
        _loc2.acc = new CVector2D(0, 0);
        _loc2.mc = null;
    } // End of the function
    function verlet(dTime, koeffDamp)
    {
        var _loc2 = this;
        var _loc3 = _loc2.pos.duplicate();
        _loc2.pos.x = _loc2.pos.x + ((_loc2.pos.x - _loc2.prevPos.x) * koeffDamp + _loc2.acc.x * dTime);
        _loc2.pos.y = _loc2.pos.y + ((_loc2.pos.y - _loc2.prevPos.y) * koeffDamp + _loc2.acc.y * dTime);
        _loc3.copyTo(_loc2.prevPos);
        if (_loc2.mc != null)
        {
            _loc2.mc._x = _loc2.pos.x;
            _loc2.mc._y = _loc2.pos.y;
        } // end if
    } // End of the function
} // End of Class
