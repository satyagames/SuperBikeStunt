class CWheel extends MovieClip
{
    function CWheel()
    {
        super();
    } // End of the function
    function init(particle_, maxAccSpeed_, rad_)
    {
        var _loc2 = this;
        _loc2.particle = particle_;
        _loc2.rad = rad_;
        _loc2.maxAccSpeed = maxAccSpeed_ * 4;
        _loc2.speed = 0;
        _loc2.accSpeed = 0;
        _loc2.rot = new CVector2D(1, 0);
        _loc2.addedAcc = new CVector2D(0, 0);
        _loc2.intersectionFlag = false;
        _loc2.lastIntersPoint = new CVector2D(0, 0);
        _loc2.lastN = new CVector2D(0, 0);
        var _loc3;
        var _loc5;
        var _loc4 = 6.283185 / _loc2.hitCount;
        _loc2.hitPointArray = new Array(_loc2.hitCount);
        _loc2.normalArray = new Array(_loc2.hitCount);
        _loc2.hitArray = new Array(_loc2.hitCount);
        _loc2.intersArray = new Array();
        for (var _loc3 = 0; _loc3 < _loc2.hitCount; ++_loc3)
        {
            _loc2.hitPointArray[_loc3] = new CVector2D(Math.sin(_loc4 * _loc3) * _loc2.rad, -Math.cos(_loc4 * _loc3) * _loc2.rad);
            _loc2.normalArray[_loc3] = _loc2.hitPointArray[_loc3].multNew(-1);
            _loc2.normalArray[_loc3].normalize();
        } // end of for
    } // End of the function
    function process(dTime, acc, koeffDamp)
    {
        var _loc2 = this;
        var _loc3 = dTime;
        _loc2.accSpeed = Math.max(-_loc2.maxAccSpeed, Math.min(_loc2.maxAccSpeed, _loc2.accSpeed + acc * _loc3));
        _loc2.speed = Math.max(-_loc2.maxSpeed * _loc3, Math.min(_loc2.speed * koeffDamp + _loc2.accSpeed, _loc2.maxSpeed * _loc3));
        _loc2.rot.rotate(_loc2.speed / _loc2.rad);
        _loc2.mc.mc_rim._rotation = Math.atan2(_loc2.rot.y, _loc2.rot.x) * 180 / 3.141593;
    } // End of the function
    function checkCollision(hit_mc)
    {
        var _loc2 = this;
        var _loc10;
        var _loc7;
        var _loc8 = new CVector2D(0, 0);
        var _loc16 = false;
        var _loc3;
        var _loc4;
        var _loc17;
        var _loc18 = new CVector2D(_loc2.particle.prevPos.x, _loc2.particle.prevPos.y);
        var _loc5 = new CVector2D(0, 0);
        var _loc15;
        _loc2._x = _loc2.particle.pos.x;
        _loc2._y = _loc2.particle.pos.y;
        _loc15 = 0;
        for (var _loc10 = 0; _loc10 < _loc2.hitCount; ++_loc10)
        {
            _loc2.hitPointArray[_loc10].copyTo(_loc8);
            _loc2.localToGlobal(_loc8);
            if (_loc2.hitArray[_loc10] = hit_mc.hitTest(_loc8.x, _loc8.y, true))
            {
                _loc16 = true;
                _loc3 = _loc10;
                ++_loc15;
            } // end if
        } // end of for
        if (_loc15 == _loc2.hitCount)
        {
            _loc2.particle.pos.x = _loc2.particle.prevPos.x + (_loc2.particle.pos.x - _loc2.particle.prevPos.x) * 0.300000;
            _loc2.particle.pos.y = _loc2.particle.prevPos.y + (_loc2.particle.pos.y - _loc2.particle.prevPos.y) * 0.300000;
            _loc2._x = _loc2.particle.pos.x;
            _loc2._y = _loc2.particle.pos.y;
            return;
        } // end if
        _loc10 = 0;
        if (_loc16)
        {
            while (true)
            {
                ++_loc10;
                if (_loc10 == _loc2.hitCount)
                {
                    _loc10 = 0;
                } // end if
                if (!_loc2.hitArray[_loc10])
                {
                    _loc3 = -1;
                    for (var _loc7 = 0; _loc7 < _loc2.hitCount; ++_loc7)
                    {
                        ++_loc10;
                        if (_loc10 == _loc2.hitCount)
                        {
                            _loc10 = 0;
                        } // end if
                        if (_loc3 == -1)
                        {
                            if (_loc2.hitArray[_loc10])
                            {
                                _loc3 = _loc10;
                                _loc5.plus(_loc2.normalArray[_loc10]);
                            } // end if
                            continue;
                        } // end if
                        if (!_loc2.hitArray[_loc10])
                        {
                            _loc4 = _loc10 - 1;
                            if (_loc4 < 0)
                            {
                                _loc4 = _loc2.hitCount - 1;
                            } // end if
                            _loc2.intersArray.push({k1: _loc3, k2: _loc4});
                            _loc3 = -1;
                            continue;
                        } // end if
                        _loc5.plus(_loc2.normalArray[_loc10]);
                    } // end of for
                    break;
                } // end if
            } // end while
            var _loc6 = new CVector2D(0, 0);
            if (_loc2.intersArray.length > 0)
            {
                _loc5.normalize();
                if (_loc2.intersectionFlag)
                {
                    _loc5.x = _loc5.x + _loc2.lastN.x;
                    _loc5.y = _loc5.y + _loc2.lastN.y;
                    _loc5.x = _loc5.x / 2;
                    _loc5.y = _loc5.y / 2;
                } // end if
                var _loc13;
                var _loc12;
                _loc17 = _loc2.intersArray.length;
                for (var _loc10 = 0; _loc10 < _loc17; ++_loc10)
                {
                    _loc13 = _loc2.intersArray.pop();
                    _loc3 = _loc13.k1;
                    _loc4 = _loc13.k2;
                    _loc2.particle.pos.minusNew(_loc2.particle.prevPos).copyTo(_loc6);
                    if (_loc5.scalar(_loc6) < 0)
                    {
                        _loc12 = Math.atan2(_loc5.y, _loc5.x);
                        _loc6.rotate(-_loc12);
                        _loc6.x = -_loc6.x * _loc2.koeffSpring;
                        _loc6.rotate(_loc12);
                        _loc2.pushOut(_loc3, _loc4, hit_mc);
                        _loc2.particle.prevPos.x = _loc2.particle.pos.x - _loc6.x;
                        _loc2.particle.prevPos.y = _loc2.particle.pos.y - _loc6.y;
                        continue;
                    } // end if
                    _loc2.pushOut(_loc3, _loc4, hit_mc);
                } // end of for
                _loc2.validateRotation(_loc5, _loc18);
                _loc2.intersectionFlag = true;
                _loc2.particle.pos.copyTo(_loc2.lastIntersPoint);
                _loc5.copyTo(_loc2.lastN);
            } // end if
        }
        else if (_loc2.intersectionFlag)
        {
            _loc2.validateRotation(_loc2.lastN, _loc18);
            _loc2.intersectionFlag = false;
        } // end else if
        _loc2._x = _loc2.particle.pos.x;
        _loc2._y = _loc2.particle.pos.y;
    } // End of the function
    function pushOut(k1, k2, hit_mc)
    {
        var _loc2 = this;
        var _loc3;
        if (k1 != k2)
        {
            _loc3 = _loc2.normalArray[k1].plusNew(_loc2.normalArray[k2]);
            _loc3.normalize();
            var _loc8 = new CVector2D(0, 0).getDistanceTo(_loc2.hitPointArray[k1], _loc2.hitPointArray[k2]);
            _loc8 = _loc2.rad - Math.abs(_loc8);
            _loc2.particle.pos.plus(_loc3.multNew(_loc8));
            _loc2.particle.prevPos.plus(_loc3.multNew(_loc8));
            return;
        } // end if
        _loc3 = _loc2.normalArray[k1];
        var _loc7 = _loc3.multNew(-_loc2.rad);
        var _loc5 = new CVector2D(0, 0);
        var _loc6 = 0;
        var _loc4 = 0.030000;
        while (true)
        {
            _loc7.copyTo(_loc5);
            _loc2.localToGlobal(_loc5);
            if (hit_mc.hitTest(_loc5.x, _loc5.y, true))
            {
                ++_loc6;
                _loc2._x = _loc2.particle.pos.x = _loc2.particle.pos.x + _loc3.x * _loc4;
                _loc2._y = _loc2.particle.pos.y = _loc2.particle.pos.y + _loc3.y * _loc4;
                continue;
            } // end if
            --_loc6;
            _loc2.particle.pos.x = _loc2.particle.pos.x - _loc3.x * _loc4;
            _loc2.particle.pos.y = _loc2.particle.pos.y - _loc3.y * _loc4;
            _loc2.particle.prevPos.plus(_loc3.multNew(_loc4 * _loc6));
            return;
        } // end while
    } // End of the function
    function validateRotation(n, oldPos)
    {
        var _loc2 = this;
        if (!_loc2.intersectionFlag && Math.abs(_loc2.accSpeed) > 0.010000)
        {
            if (Math.abs(_loc2.accSpeed) < _loc2.maxAccSpeed * 0.020000 / 2)
            {
                _loc2.accSpeed = 0;
            }
            else if (_loc2.accSpeed > 0)
            {
                _loc2.accSpeed = _loc2.maxAccSpeed * 0.020000;
            }
            else
            {
                _loc2.accSpeed = -_loc2.maxAccSpeed * 0.020000;
            } // end else if
        } // end else if
        var _loc4 = new CVector2D(-n.y, n.x);
        var _loc7 = _loc2.particle.pos.minusNew(oldPos);
        var _loc6 = Math.atan2(_loc4.y, _loc4.x);
        var _loc3 = _loc7.rotateNew(-_loc6);
        _loc2.speed = _loc3.x + _loc2.accSpeed;
        _loc3.y = 0;
        _loc3.rotate(_loc6);
        var _loc5 = 1 - _loc2.koeffSlip;
        _loc2.particle.pos.x = _loc2.particle.pos.x + _loc4.x * _loc2.accSpeed * _loc5 - (1 - _loc2.koeffFriction) * _loc3.x;
        _loc2.particle.pos.y = _loc2.particle.pos.y + _loc4.y * _loc2.accSpeed * _loc5 - (1 - _loc2.koeffFriction) * _loc3.y;
        _loc2.accSpeed = _loc2.accSpeed * _loc2.koeffSlip;
    } // End of the function
    function applyAddedAcc()
    {
        var _loc2 = this;
        _loc2.particle.acc.x = _loc2.particle.acc.x + _loc2.addedAcc.x * _loc2.particle.mass;
        _loc2.particle.acc.y = _loc2.particle.acc.y + _loc2.addedAcc.y * _loc2.particle.mass;
    } // End of the function
    var maxSpeed = 180;
    var koeffSpring = 0.050000;
    var koeffSlip = 0.150000;
    var koeffFriction = 0.970000;
    var hitCount = 32;
} // End of Class
