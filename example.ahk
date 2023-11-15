#Requires Autohotkey v2
#include <ReadRun>
;example 1 -- the usage of RunCMD classic style
MsgBox RunCMD("cmd /c dir")
MsgBox RunCMD("cmd /c dir",(line,index)=>index . "`t" . line)

;example 2 -- the usage of ReadRun new style
for line in ReadRun("ping www.bing.com -n 2") {
  MsgBox line,A_Index
}
;example 3 -- How to cancel the Running CmdLine

MsgBox RunCmd("ping autohotkey.com -n 1",pingHelper) ; 104.18.44.93

pingHelper(Line, LineNum) {
  If (LineNum=2)
    {
      ReadRun.PID := 0 ; Cancel RunCMD()
      Return StrSplit(Line, ["[","]"])[2]
    }
}
