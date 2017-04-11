class CParticleEngine
{
    var hit_mc, prevTime;
    function CParticleEngine()
    {
    } // End of the function
    function clear()
    {
        var _loc2 = this;
        while (_loc2.p_array.pop() != undefined)
        {
        } // end while
        while (_loc2.w_array.pop() != undefined)
        {
        } // end while
        while (_loc2.c_array.pop() != undefined)
        {
        } // end while
    } // End of the function
    function setHitMovie(hit_mc_)
    {
        hit_mc = hit_mc_;
    } // End of the function
    function addParticle(p)
    {
        p_array.push(p);
    } // End of the function
    function addWheel(wheel, p, maxSpeed, radius)
    {
        wheel.init(p, maxSpeed, radius);
        w_array.push(wheel);
    } // End of the function
    function addSpringConstraint(p1, p2, koeffStiff1, koeffStiff2)
    {
        var _loc2 = new CSpringConstraint(p1, p2, koeffStiff1, koeffStiff2);
        c_array.push(_loc2);
    } // End of the function
    function start()
    {
        prevTime = getTimer();
    } // End of the function
    function computeForces()
    {
        var _loc3 = this;
        var _loc2;
        var _loc4 = _loc3.p_array.length;
        for (var _loc2 = 0; _loc2 < _loc4; ++_loc2)
        {
            _loc3.p_array[_loc2].acc.x = 0;
            _loc3.p_array[_loc2].acc.y = _loc3.gravity * _loc3.p_array[_loc2].mass;
        } // end of for
    } // End of the function
    function clearForces()
    {
        var _loc4 = w_array.length;
        var _loc2;
        var _loc3;
        for (var _loc2 = 0; _loc2 < _loc4; ++_loc2)
        {
            _loc3 = w_array[_loc2];
            _loc3.addedAcc.x = _loc3.addedAcc.y = 0;
        } // end of for
    } // End of the function
    function applyManFrictions()
    {
        var _loc3 = this;
        var _loc4 = _loc3.w_array.length;
        var _loc2;
        for (var _loc2 = 0; _loc2 < _loc4; ++_loc2)
        {
            _loc3.w_array[_loc2].applyAddedAcc();
        } // end of for
    } // End of the function
    function verlet(dTime)
    {
        var _loc3 = this;
        var _loc7 = 0.995000;
        var _loc2;
        var _loc4 = _loc3.p_array.length;
        for (var _loc2 = 0; _loc2 < _loc4; ++_loc2)
        {
            _loc3.p_array[_loc2].verlet(dTime, _loc7);
        } // end of for
        _loc4 = _loc3.w_array.length;
        var _loc6 = 0;
        if (Key.isDown(40))
        {
            _loc6 = -0.600000;
        }
        else if (Key.isDown(38))
        {
            _loc6 = 1;
        } // end else if
        for (var _loc2 = 0; _loc2 < _loc4; ++_loc2)
        {
            _loc3.w_array[_loc2].process(dTime, _loc3.w_array[_loc2].maxAccSpeed * _loc6 / 3.200000, 0.990000);
        } // end of for
    } // End of the function
    function checkCollisions()
    {
        var _loc3 = this;
        var _loc2;
        var _loc4 = _loc3.w_array.length;
        for (var _loc2 = 0; _loc2 < _loc4; ++_loc2)
        {
            _loc3.w_array[_loc2].checkCollision(_loc3.hit_mc);
        } // end of for
    } // End of the function
    function checkConstraints(dTime)
    {
        var _loc3 = this;
        var _loc2;
        var _loc4 = _loc3.c_array.length;
        for (var _loc2 = 0; _loc2 < _loc4; ++_loc2)
        {
            _loc3.c_array[_loc2].resolve(dTime);
        } // end of for
    } // End of the function
    function process()
    {
        var _loc2 = this;
        var _loc5 = getTimer();
        var _loc6 = (_loc5 - _loc2.prevTime) / 1000;
        _loc2.prevTime = _loc5;
        var _loc3;
        var _loc4 = Math.min(Math.round(_loc6 / _loc2.t), _loc2.maxSteps);
        for (var _loc3 = 0; _loc3 < _loc4; ++_loc3)
        {
            _loc2.computeForces();
            _loc2.applyManFrictions();
            _loc2.verlet(_loc2.t);
            _loc2.checkConstraints(_loc2.t);
            _loc2.checkCollisions();
        } // end of for
        _loc2.clearForces();
    } // End of the function
    var p_array = new Array();
    var w_array = new Array();
    var c_array = new Array();
    var t = 0.020000;
    var maxSteps = 2;
    var gravity = 3.150000;
} // End of Class
