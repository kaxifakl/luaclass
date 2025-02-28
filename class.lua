---@class Object
local Object = {};
Object.super = Object;

function Object:ctor()
end

---@param parent T|nil 父类的原型表，如果为 nil 则使用 Object 作为父类
---@generic T : Object
---@return T
function class(parent)
    -- 检查传入的 parent 是否为表
    if parent and type(parent) ~= "table" then
        error("Parent must be a Object")
    end

    -- 默认使用 Object 作为基类
    parent = parent or Object
    local obj = {};
    setmetatable(obj, {
        __index = parent,
        __call = function(self, ...)
            local instance = {};
            setmetatable(instance, {
                __index = self
            })
            instance:ctor(...);
            return instance;
        end
    })
    obj.super = parent;
    return obj;
end
