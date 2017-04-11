class CVector2D
{
    var x, y;
    function CVector2D(x_, y_)
    {
        x = x_;
        y = y_;
    } // End of the function
    function reinit(x_, y_)
    {
        x = x_;
        y = y_;
    } // End of the function
    function getUgol()
    {
        return (Math.atan2(y, x));
    } // End of the function
    function duplicate()
    {
        return (new CVector2D(x, y));
    } // End of the function
    function copyTo(v)
    {
        v.x = x;
        v.y = y;
    } // End of the function
    function minus(v)
    {
        x = x - v.x;
        y = y - v.y;
    } // End of the function
    function minusNew(v)
    {
        return (new CVector2D(x - v.x, y - v.y));
    } // End of the function
    function normalize()
    {
        var _loc2 = this;
        var _loc3 = Math.sqrt(_loc2.x * _loc2.x + _loc2.y * _loc2.y);
        _loc2.x = _loc2.x / _loc3;
        _loc2.y = _loc2.y / _loc3;
    } // End of the function
    function reverseNew()
    {
        return (new CVector2D(-x, -y));
    } // End of the function
    function scalar(v)
    {
        return (x * v.x + y * v.y);
    } // End of the function
    function modul()
    {
        var _loc2 = this;
        Math.sqrt(_loc2.x * _loc2.x + _loc2.y * _loc2.y);
        return (Math.sqrt(_loc2.x * _loc2.x + _loc2.y * _loc2.y));
    } // End of the function
    function reflectFromNormal(n)
    {
        var _loc2 = this;
        var _loc3 = Math.atan2(n.y, n.x);
        _loc2.rotate(-_loc3);
        _loc2.x = -_loc2.x;
        _loc2.rotate(_loc3);
    } // End of the function
    function rotate(u)
    {
        var _loc3 = u;
        var _loc2 = this;
        var _loc5 = _loc2.x;
        var _loc4 = _loc2.y;
        _loc2.x = _loc5 * Math.cos(_loc3) - _loc4 * Math.sin(_loc3);
        _loc2.y = _loc5 * Math.sin(_loc3) + _loc4 * Math.cos(_loc3);
    } // End of the function
    function rotateNew(u)
    {
        var _loc3 = u;
        var _loc2 = this;
        new CVector2D(_loc2.x * Math.cos(_loc3) - _loc2.y * Math.sin(_loc3), _loc2.x * Math.sin(_loc3) + _loc2.y * Math.cos(_loc3));
        return (new CVector2D(_loc2.x * Math.cos(_loc3) - _loc2.y * Math.sin(_loc3), _loc2.x * Math.sin(_loc3) + _loc2.y * Math.cos(_loc3)));
    } // End of the function
    function mult(k)
    {
        x = x * k;
        y = y * k;
    } // End of the function
    function multNew(k)
    {
        return (new CVector2D(x * k, y * k));
    } // End of the function
    function plus(v)
    {
        x = x + v.x;
        y = y + v.y;
    } // End of the function
    function plusNew(v)
    {
        return (new CVector2D(x + v.x, y + v.y));
    } // End of the function
    function getDistanceTo(p1, p2)
    {
        var _loc2 = p1;
        var _loc3 = _loc2.y - p2.y;
        var _loc4 = p2.x - _loc2.x;
        var _loc5 = _loc2.x * (p2.y - _loc2.y) - _loc2.y * (p2.x - _loc2.x);
        var _loc6 = Math.sqrt(_loc3 * _loc3 + _loc4 * _loc4);
        _loc3 = _loc3 / _loc6;
        _loc4 = _loc4 / _loc6;
        _loc5 = _loc5 / _loc6;
        _loc3 * x + _loc4 * y + _loc5;
        return (_loc3 * x + _loc4 * y + _loc5);
    } // End of the function
} // End of Class
