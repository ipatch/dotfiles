local obj={}
obj.__index = obj

function obj:init()
  function SpoonTestConsolePrint()
    print("Hello console, from `SpoonTest")
    alert("Hello, Hammerspoon!")
  end
end

return obj
