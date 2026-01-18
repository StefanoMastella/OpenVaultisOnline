# Guia de Mídia no Obsidian Synapses

## ✅ Suporte a Vídeo no Quartz

**Ótima notícia**: Quartz **SUPORTA vídeo .mp4** nativamente!

### Como Funciona

1. **Coloque o vídeo no vault**: Qualquer pasta, ex: `Anexos/video-tutorial.mp4`
2. **Referencie no Markdown**: Use link normal `[[Anexos/video-tutorial.mp4]]`
3. **Quartz converte automaticamente** para tag HTML `<video>` com controles

### Formatos Suportados

- `.mp4` ✅
- `.webm` ✅
- `.ogv` ✅
- `.mov` ✅
- `.mkv` ✅

### Exemplo de Uso

```markdown
Assista ao tutorial: [[Anexos/tutorial-canvas.mp4]]
```

Quartz automaticamente renderiza como:
```html
<video src="anexos/tutorial-canvas.mp4" controls></video>
```

## 🖼️ Adicionar Imagens ao Canvas

### Método 1: Arrastar e Soltar

1. Abra o Canvas
2. Arraste a imagem da pasta do computador diretamente para o Canvas
3. A imagem será copiada para o vault e adicionada ao Canvas

### Método 2: Menu do Canvas

1. No Canvas, clique no **terceiro botão** (ícone de mídia)
2. Selecione o arquivo de imagem do vault
3. Posicione onde quiser

### Método 3: Via Código (Canvas JSON)

No arquivo `.canvas`, adicione um nó do tipo `file`:

```json
{
  "id": "imagem_hub",
  "type": "file",
  "file": "Anexos/logo-obsidian-synapses.png",
  "x": 400,
  "y": -200,
  "width": 200,
  "height": 200
}
```

## 📁 Estrutura Recomendada

Crie uma pasta `Anexos/` ou `Assets/` no vault para organizar:

```
Obsidian Synapses/
├── Anexos/
│   ├── Imagens/
│   │   ├── logo-obsidian-synapses.png
│   │   ├── screenshot-canvas.png
│   │   └── diagrama-fluxo.png
│   └── Videos/
│       ├── tutorial-intro.mp4
│       └── demo-hands-on.mp4
├── ComeceAqui.canvas
└── ...
```

## 🎬 Vídeos no Canvas

Para adicionar vídeo ao Canvas:

1. Coloque o `.mp4` no vault (ex: `Anexos/video.mp4`)
2. No Canvas, use o menu de mídia (terceiro botão)
3. Selecione o arquivo de vídeo
4. O vídeo aparecerá como elemento no Canvas

**Nota**: No Canvas do Obsidian, vídeos aparecem como elementos, mas podem precisar ser clicados para reproduzir (dependendo da versão).

## 📝 Vídeos em Arquivos Markdown

Para usar vídeo em arquivos `.md` que serão publicados no Quartz:

```markdown
## Tutorial em Vídeo

Assista ao passo a passo:

[[Anexos/tutorial-completo.mp4]]
```

Quartz automaticamente renderiza com controles de vídeo.

## 💡 Dicas

1. **Otimize vídeos**: Use compressão para reduzir tamanho (ex: HandBrake)
2. **Nomes descritivos**: Facilita encontrar depois
3. **Organize por tipo**: Separe imagens, vídeos, PDFs
4. **Backup**: Vídeos grandes podem pesar no vault - considere backup separado

## 🔗 Referências

- [Quartz Assets Plugin](https://quartz.jzhao.xyz/plugins/Assets/)
- [Obsidian Canvas Documentation](https://obsidian.md/canvas)

---

**Pronto para adicionar mídia ao seu tutorial!** 🎉

