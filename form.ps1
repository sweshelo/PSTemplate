function GUIForm(){

    param(
        [Parameter(Mandatory=$true)][string]$message="",
        [string]$title="PowerShell",
        [switch]$button=$false,
        [string]$buttonMessage="OK",
        [int]$width=300,
        [int]$height=200,
        [array]$list=@(),
        [int]$margin = 10,
        [int]$fontsize = 10,
        [int]$messagePX = 5,
        [int]$messagePY = 5,
        [int]$buttonSizeW = 75,
        [int]$buttonSizeH = 30,
        [string]$font = "ÇlÇr ÉSÉVÉbÉN"
    )

    # Load assenbly
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    # Create form
    $_form               = New-Object System.Windows.Forms.Form
    $_form.Size          = "$width, $height"
    $_form.Text          = $title
    $_form.StartPosition = "CenterScreen"

    # Button
    $_btW = [int]($width/2-$buttonSizeW/2)
    $_btH = [int]($height-$buttonSizeH*2.5-$margin)
    $_button              = New-Object System.Windows.Forms.Button
    $_button.Location     = "$_btW, $_btH"
    $_button.Size         = "$buttonSizeW, $buttonSizeH"
    $_button.Text         = $buttonMessage
    $_Button.DialogResult = "OK"

    # Message
    $_msW = [int]($width-$margin)
    $_msH = [int]($height-$margin-$buttonSizeH*3)
    $_message          = New-Object System.Windows.Forms.Label
    $_message.Location = "$messagePX, $messagePY"
    $_message.Size     = "$_msW, $_msH"
    $_message.Font     = "$font,$fontsize"
    $_message.Text     = $message

    # CheckBox
    if ($list -ne $null){
        $cb_W = [int]($width-($messagePX+$margin)*3)
        $cb_H = [int]($height-$margin-$buttonSizeH*4)
        $_checkbox          = New-Object System.Windows.Forms.CheckedListBox
        $_checkbox.Location = "$($messagePX+$margin), $($messagePY+$FontSize+$margin)"
        $_checkbox.Size     = "$cb_W, $cb_H"
        $_checkbox.Items.AddRange($list)
        $_checkbox.ClearSelected()
        $_form.Controls.Add($_checkbox)
   }


    # controller
    $_form.AcceptButton = $_button
    $_form.Controls.Add($_message)
    $_form.Controls.Add($_button)

    $_form_res = $_form.ShowDialog()
    if ($list -ne $null){
        return @($_checkbox.CheckedItems)
    }else{
        return $_form_res
    }

}