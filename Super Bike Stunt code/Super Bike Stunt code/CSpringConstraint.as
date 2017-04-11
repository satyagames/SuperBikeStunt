class CSpringConstraint
{
    function CSpringConstraint(p1_, p2_, koeffStiffPress_, koeffStiffStretch_)
    {
        var _loc2 = this;
        _loc2.p1 = p1_;
        _loc2.p2 = p2_;
        _loc2.koeffStiffPress = koeffStiffPress_;
        _loc2.koeffStiffStretch = koeffStiffStretch_;
        var _loc3 = new CVector2D(_loc2.p1.pos.x - _loc2.p2.pos.x, _loc2.p1.pos.y - _loc2.p2.pos.y);
        _loc2.relaxLen = _loc3.modul();
    } // End of the function
    function resolve(dTime)
    {
        var _loc2 = this;
        var _loc3 = new CVector2D(_loc2.p1.pos.x - _loc2.p2.pos.x, _loc2.p1.pos.y - _loc2.p2.pos.y);
        var _loc5 = _loc3.modul();
        var _loc6 = (_loc2.relaxLen - _loc5) / _loc5;
        _loc3.mult(_loc6);
        var _loc4;
        if (_loc5 > _loc2.relaxLen)
        {
            _loc4 = _loc2.koeffStiffStretch;
        }
        else
        {
            _loc4 = _loc2.koeffStiffPress;
        } // end else if
        _loc2.p2.pos.x = _loc2.p2.pos.x - _loc3.x * (_loc2.p1.mass / (_loc2.p1.mass + _loc2.p2.mass) + 1) / 2 * _loc4;
        _loc2.p2.pos.y = _loc2.p2.pos.y - _loc3.y * (_loc2.p1.mass / (_loc2.p1.mass + _loc2.p2.mass) + 1) / 2 * _loc4;
        _loc2.p1.pos.x = _loc2.p1.pos.x + _loc3.x * (_loc2.p2.mass / (_loc2.p1.mass + _loc2.p2.mass) + 1) / 2 * _loc4;
        _loc2.p1.pos.y = _loc2.p1.pos.y + _loc3.y * (_loc2.p2.mass / (_loc2.p1.mass + _loc2.p2.mass) + 1) / 2 * _loc4;
    } // End of the function
} // End of Class
