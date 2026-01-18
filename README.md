# OpenVaultisOnline - Obsidian Synapses

🌐 Site estático gerado com **Quartz 4** a partir do vault **Obsidian Synapses**.

**URL**: https://stefanomastella.github.io/OpenVaultisOnline

## 🚀 Como usar

### Sincronização e Build Automatizado

Use o script PowerShell para sincronizar o vault e fazer build:

```powershell
.\sync-and-build.ps1
```

Este script:
1. Sincroniza o conteúdo do vault "Obsidian Synapses" para a pasta `content`
2. Faz o build do Quartz
3. Gera o site estático na pasta `public`

### Build Manual

```bash
# Build do site
npx quartz build

# Preview local (abre em http://localhost:8080)
npx quartz preview
```

### Deploy

O site é **automaticamente publicado** via GitHub Actions quando você faz push para a branch `main`.

**Para ativar GitHub Pages:**
1. Vá em Settings > Pages no repositório
2. Source: **GitHub Actions**
3. O site estará disponível em: https://stefanomastella.github.io/OpenVaultisOnline

## 📝 Configuração

- **Vault**: `Obsidian Synapses`
- **Gerador**: Quartz 4.5.2
- **Hosting**: GitHub Pages
- **Idioma**: Português (pt-BR)
- **Tema**: Customizado

## 🔧 Personalização

Edite `quartz.config.ts` para personalizar:
- Título e descrição
- Cores e tipografia
- Plugins e funcionalidades
- Idioma e localização

## 📚 Estrutura

```
OpenVaultisOnline/
├── content/          # Conteúdo sincronizado do vault
├── public/           # Site gerado (não versionar)
├── quartz/           # Código do Quartz
├── quartz.config.ts  # Configuração principal
└── .github/          # GitHub Actions workflows
```

## 🔄 Workflow de Atualização

1. **Edite o vault** "Obsidian Synapses" normalmente no Obsidian
2. **Execute o script**: `.\sync-and-build.ps1`
3. **Commit e push**: As alterações serão publicadas automaticamente

## ⚠️ Notas

- Arquivos `.canvas` não são renderizados nativamente pelo Quartz
- A pasta `.obsidian` é ignorada automaticamente
- O build leva ~2 minutos para processar todos os arquivos

---

**Criado por**: Stéfano Girotto | [DracoLogos](https://dracoLogos.com) | [Sonosfera](https://sonosfera.com)

