# PowerShell script to rename and update location files for Brunswick County, NC
$ErrorActionPreference = "Stop"

$basePath = "c:\Users\alooma\Desktop\ductless-mini-splits-repair-san-jose-ca-main\ductless mini splits leland nc"
$locationsPath = Join-Path $basePath "locations"

# Define the mapping of old location names to new NC locations
$locationMappings = @{
    "santa-clara" = @{ name = "brunswick-county"; displayName = "Brunswick County" }
    "sunnyvale" = @{ name = "wilmington"; displayName = "Wilmington" }
    "milpitas" = @{ name = "southport"; displayName = "Southport" }
    "campbell" = @{ name = "oak-island"; displayName = "Oak Island" }
    "cupertino" = @{ name = "bolivia"; displayName = "Bolivia" }
    "fremont" = @{ name = "supply"; displayName = "Supply" }
    "mountain-view" = @{ name = "winnabow"; displayName = "Winnabow" }
    "palo-alto" = @{ name = "belville"; displayName = "Belville" }
    "union-city" = @{ name = "navassa"; displayName = "Navassa" }
    "hayward" = @{ name = "sandy-creek"; displayName = "Sandy Creek" }
    "menlo-park" = @{ name = "carolina-beach"; displayName = "Carolina Beach" }
    "los-altos" = @{ name = "kure-beach"; displayName = "Kure Beach" }
    "los-gatos" = @{ name = "caswell-beach"; displayName = "Caswell Beach" }
    "livermore" = @{ name = "yaupon-beach"; displayName = "Yaupon Beach" }
    "foster-city" = @{ name = "long-beach"; displayName = "Long Beach" }
    "dublin" = @{ name = "holden-beach"; displayName = "Holden Beach" }
    "newark" = @{ name = "ocean-isle-beach"; displayName = "Ocean Isle Beach" }
    "pleasanton" = @{ name = "sunset-beach"; displayName = "Sunset Beach" }
    "redwood-city" = @{ name = "calabash"; displayName = "Calabash" }
    "san-mateo" = @{ name = "shallotte"; displayName = "Shallotte" }
}

Write-Host "Updating location files for Brunswick County, NC..."

# Process each old location file
foreach ($oldLocation in $locationMappings.Keys) {
    $oldFile = Join-Path $locationsPath "$oldLocation.html"
    $newLocation = $locationMappings[$oldLocation]
    $newFile = Join-Path $locationsPath "$($newLocation.name).html"
    
    if (Test-Path $oldFile) {
        Write-Host "Processing: $oldLocation -> $($newLocation.name)"
        
        # Read the old file
        $content = Get-Content -Path $oldFile -Raw -Encoding UTF8
        
        # Extract the old display name from the original filename
        $oldDisplayName = (Get-Culture).TextInfo.ToTitleCase($oldLocation.Replace("-", " "))
        if ($oldLocation -eq "palo-alto") { $oldDisplayName = "Palo Alto" }
        elseif ($oldLocation -eq "santa-clara") { $oldDisplayName = "Santa Clara" }
        elseif ($oldLocation -eq "mountain-view") { $oldDisplayName = "Mountain View" }
        elseif ($oldLocation -eq "union-city") { $oldDisplayName = "Union City" }
        elseif ($oldLocation -eq "menlo-park") { $oldDisplayName = "Menlo Park" }
        elseif ($oldLocation -eq "los-altos") { $oldDisplayName = "Los Altos" }
        elseif ($oldLocation -eq "los-gatos") { $oldDisplayName = "Los Gatos" }
        elseif ($oldLocation -eq "foster-city") { $oldDisplayName = "Foster City" }
        elseif ($oldLocation -eq "redwood-city") { $oldDisplayName = "Redwood City" }
        elseif ($oldLocation -eq "san-mateo") { $oldDisplayName = "San Mateo" }
        
        # Replace the old location name with the new one throughout the content
        $content = $content -replace [regex]::Escape($oldDisplayName), $newLocation.displayName
        $content = $content -replace [regex]::Escape($oldLocation), $newLocation.name
        
        # Update specific location references
        $content = $content -replace "Expert ductless mini split installation and repair in $($oldDisplayName), NC", "Expert ductless mini split installation and repair in $($newLocation.displayName), NC"
        $content = $content -replace "ductless mini splits $oldDisplayName", "ductless mini splits $($newLocation.displayName)"
        $content = $content -replace "HVAC $oldDisplayName", "HVAC $($newLocation.displayName)"
        $content = $content -replace "$oldDisplayName Ductless Mini Splits", "$($newLocation.displayName) Ductless Mini Splits"
        
        # Update coordinates for major NC coastal locations
        $coordinates = @{
            "wilmington" = @{ lat = "34.2257"; lon = "-77.9447" }
            "southport" = @{ lat = "33.9293"; lon = "-78.0197" }
            "oak-island" = @{ lat = "33.9155"; lon = "-78.1347" }
            "bolivia" = @{ lat = "34.0677"; lon = "-78.1558" }
            "supply" = @{ lat = "34.0965"; lon = "-78.2325" }
            "brunswick-county" = @{ lat = "34.0532"; lon = "-78.2628" }
        }
        
        if ($coordinates.ContainsKey($newLocation.name)) {
            $coord = $coordinates[$newLocation.name]
            $content = $content -replace "34\.2287", $coord.lat
            $content = $content -replace "-78\.0161", $coord.lon
        }
        
        # Write the updated content to the new file
        Set-Content -Path $newFile -Value $content -Encoding UTF8
        
        # Remove the old file if it's different from the new file
        if ($oldFile -ne $newFile -and (Test-Path $oldFile)) {
            Remove-Item $oldFile -Force
        }
        
        Write-Host "  Created: $($newLocation.name).html"
    }
}

Write-Host "Location files update completed!"
