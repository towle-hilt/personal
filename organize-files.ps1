# organize-files.ps1

param(
    [System.IO.File] $Path,

    [ValidateSet("CreationDate","ModifiedDate","FileType","FileSize","Owner")]
    [String]$OrganizeBy
)

begin {
    $Items = Get-ChildItem -Path $Path
}

process {
    foreach ($item in $items) {

    }
}