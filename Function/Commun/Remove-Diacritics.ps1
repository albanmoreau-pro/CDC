function Remove-Diacritics
{
	param ([String]$String = [String]::Empty)
	$normalized = $String.Normalize([Text.NormalizationForm]::FormD)
	$sb = new-object Text.StringBuilder
	$normalized.ToCharArray() | ForEach-Object {
		if ([Globalization.CharUnicodeInfo]::GetUnicodeCategory($_) -ne [Globalization.UnicodeCategory]::NonSpacingMark)
		{
			[void]$sb.Append($_)
		}
	}
	$sb.ToString()
}