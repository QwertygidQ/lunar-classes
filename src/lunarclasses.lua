lunarclasses = {}

local function search(field, parent_classes)    
    for k, class in pairs(parent_classes) do
        local in_class_field = class[field]
        if in_class_field then
            return in_class_field
        end
    end
end

function lunarclasses.create_class(parent_classes, constructor)
    if parent_classes and type(parent_classes) ~= "table" then
        error("Class: parent_classes should be a table")
    elseif constructor and type(constructor) ~= "function" then
        error("Class: constructor should be a function")
    end
    
    parent_classes = parent_classes or {}
    
    class = {super=parent_classes, static={}}
    
    class.new = constructor or
        function(self, o)
            o = o or {}
            setmetatable(o, class)
            return o
        end

    setmetatable(class, {__index =
                            function(table, field)
                                local in_class_field = search(field, parent_classes)
                                table[field] = in_class_field
                                return in_class_field
                            end,
                        __call = class.new
                        })
                
    class.__index = class
    
    return class
end