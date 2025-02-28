require('class');

---@class Point : Object
---@field x number
---@field y number
---@return Point
Point = class();
Point.x = 10;
Point.y = 20;

function Point:ctor(a, b)
    print("Point ctor");
end

local p = Point();
p.x = 100;
print(p.x, p.y);

-- 100 20

---@class Point2 : Point
---@field super Point
Point2 = class(Point);
Point2.z = 30;

function Point2:ctor(num)
    self.super:ctor();
    self.z = num;
    print("Point2 ctor", self.z);
end

local p2 = Point2(13);
print(p2.x, p2.y, p2.z);

-- 10 20 30
