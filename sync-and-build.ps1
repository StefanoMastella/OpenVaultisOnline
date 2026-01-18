# Script de Sincronização e Build - OpenVaultisOnline
# Sincroniza o vault "Obsidian Synapses" e faz build do Quartz

$ErrorActionPreference = "Stop"

Write-Host "🔄 Sincronizando Obsidian Synapses para Quartz..." -ForegroundColor Cyan
Write-Host ""

$baseDir = "D:\Users\Stefa\Documents\Obsidian Vaults"
$vaultPath = Join-Path $baseDir "Obsidian Synapses"
$repoPath = Join-Path $baseDir "OpenVaultisOnline"
$contentPath = Join-Path $repoPath "content"

Set-Location $repoPath

# Passo 1: Limpar pasta content (exceto arquivos importantes)
Write-Host "🧹 Limpando pasta content..." -ForegroundColor Yellow
if (Test-Path $contentPath) {
    Get-ChildItem -Path $contentPath -Recurse | Remove-Item -Force -Recurse
    Write-Host "   ✅ Pasta content limpa" -ForegroundColor Green
}

# Passo 2: Copiar conteúdo do vault
Write-Host ""
Write-Host "📥 Copiando conteúdo do vault..." -ForegroundColor Yellow
robocopy $vaultPath $contentPath /E /XD ".obsidian" /XF "*.canvas" "GUIA-PUBLICACAO-QUARTZ.md" "setup-quartz.ps1" "setup-openvaultis-quartz.ps1" /NFL /NDL /NJH /NJS /R:3 /W:1

if ($LASTEXITCODE -le 1) {
    Write-Host "   ✅ Conteúdo copiado com sucesso" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  Alguns arquivos podem não ter sido copiados (código: $LASTEXITCODE)" -ForegroundColor Yellow
}

# Passo 3: Build do Quartz
Write-Host ""
Write-Host "🔨 Fazendo build do Quartz..." -ForegroundColor Yellow
npx quartz build

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Build concluído com sucesso!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📝 Próximos passos:" -ForegroundColor Cyan
    Write-Host "   1. Verifique o resultado: npx quartz preview" -ForegroundColor White
    Write-Host "   2. Commit e push:" -ForegroundColor White
    Write-Host "      git add ." -ForegroundColor Gray
    Write-Host "      git commit -m 'Update: Sync Obsidian Synapses'" -ForegroundColor Gray
    Write-Host "      git push" -ForegroundColor Gray
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "❌ Erro no build!" -ForegroundColor Red
    exit 1
}

