# PowerShell script to update all HTML files for Leland, NC
# This script replaces San Jose, CA content with Leland, NC content

$ErrorActionPreference = "Stop"

# Define the path to the HTML files
$basePath = "c:\Users\alooma\Desktop\ductless-mini-splits-repair-san-jose-ca-main\ductless mini splits leland nc"

# Get all HTML files
$htmlFiles = Get-ChildItem -Path $basePath -Recurse -Filter "*.html"

Write-Host "Found $($htmlFiles.Count) HTML files to update..."

# Define replacement mappings
$replacements = @{
    # Basic location replacements
    "San Jose, CA" = "Leland, NC"
    "San Jose, California" = "Leland, North Carolina"
    "San Jose" = "Leland"
    "California" = "North Carolina"
    '"CA"' = '"NC"'
    " CA " = " NC "
    " CA)" = " NC)"
    " CA'" = " NC'"
    " CA," = " NC,"
    " CA." = " NC."
    " CA<" = " NC<"
    
    # Business name replacements
    "San Jose Ductless Mini Splits" = "Leland Ductless Mini Splits"
    "San Jose Mini Splits" = "Leland Mini Splits"
    
    # Address replacements
    "1500 Technology Dr" = "1234 Village Rd"
    "95110" = "28451"
    
    # Geographic references
    "Santa Clara County" = "Brunswick County"
    "South Bay" = "Brunswick County"
    "Bay Area" = "coastal North Carolina"
    "Silicon Valley" = "Brunswick County"
    
    # Climate references
    "Mediterranean climate" = "humid subtropical climate"
    "cool, foggy mornings" = "warm, humid mornings"
    "mild winters" = "mild winters"
    
    # Coordinate updates
    "37.3382" = "34.2287"
    "-121.8863" = "-78.0161"
    "37.4032" = "34.2287"
    "-121.9776" = "-78.0161"
    
    # Email addresses
    "info@sanjoseminisplits.com" = "info@lelandminisplits.com"
    
    # Service area references
    "South Bay area" = "Brunswick County area"
    "greater South Bay" = "greater Brunswick County"
    
    # Location-specific references in alt text
    "San Jose HVAC" = "Leland HVAC"
    "San Jose CA" = "Leland NC"
}

# Additional North Carolina specific locations for dropdown menus
$locationReplacements = @{
    "Santa Clara" = "Brunswick County"
    "Sunnyvale" = "Wilmington"
    "Milpitas" = "Southport"
    "Campbell" = "Oak Island"
    "Cupertino" = "Bolivia"
    "Fremont" = "Supply"
    "Mountain View" = "Winnabow"
    "Palo Alto" = "Belville"
    "Union City" = "Navassa"
    "Hayward" = "Sandy Creek"
    "Menlo Park" = "Carolina Beach"
    "Los Altos" = "Kure Beach"
    "Los Gatos" = "Caswell Beach"
    "Livermore" = "Yaupon Beach"
    "Foster City" = "Long Beach"
    "Dublin" = "Holden Beach"
    "Newark" = "Ocean Isle Beach"
    "Pleasanton" = "Sunset Beach"
    "Redwood City" = "Calabash"
    "San Mateo" = "Shallotte"
}

# Process each HTML file
foreach ($file in $htmlFiles) {
    Write-Host "Processing: $($file.Name)"
    
    try {
        # Read the file content
        $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
        
        # Apply basic replacements
        foreach ($key in $replacements.Keys) {
            $content = $content -replace [regex]::Escape($key), $replacements[$key]
        }
        
        # Apply location replacements for navigation menus and links
        foreach ($key in $locationReplacements.Keys) {
            # Update location names in navigation and links, but preserve file paths
            $content = $content -replace "($key)(?=\.html|</a>|<)", $locationReplacements[$key]
        }
        
        # Special handling for zip codes - replace CA zip codes with NC
        $content = $content -replace "95\d{3}", "28451"
        
        # Update specific regional references
        $content = $content -replace "tech campus buildings", "coastal communities"
        $content = $content -replace "Victorian homes", "historic coastal homes"
        $content = $content -replace "downtown San Jose", "downtown Leland"
        $content = $content -replace "North San Jose", "northern Brunswick County"
        $content = $content -replace "East San Jose", "eastern Brunswick County"
        $content = $content -replace "West San Jose", "western Brunswick County"
        
        # Update climate-specific references
        $content = $content -replace "seasonal pollen, dust, and urban air pollution", "seasonal pollen, salt air, and humidity"
        $content = $content -replace "urban air pollution", "salt air and coastal humidity"
        $content = $content -replace "California's energy regulations", "North Carolina's building codes"
        
        # Write the updated content back to the file
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        
        Write-Host "  Updated successfully"
    }
    catch {
        Write-Error "Failed to process $($file.Name): $($_.Exception.Message)"
    }
}

Write-Host "Content update completed for all HTML files!"
