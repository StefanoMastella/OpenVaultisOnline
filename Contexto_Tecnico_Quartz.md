---
tags:
  - tech
  - quartz
  - documentation
  - setup
created: 2025-12-27
status: reference
---

# Contexto Técnico: Quartz v4 & Integração Obsidian

> **Objetivo:** Referência rápida para implementação do Quartz v4 com suporte a Canvas e personalização avançada.

## 1. Instalação & Requisitos
*   **Node.js:** v22+
*   **NPM:** v10.9.2+
*   **Comandos Iniciais:**
    ```bash
    git clone https://github.com/jackyzha0/quartz.git
    cd quartz
    npm i
    npx quartz create
    ```

## 2. Estrutura de Configuração (`quartz.config.ts`)
Arquivo central para plugins e comportamento global.

```typescript
const config: QuartzConfig = {
  configuration: {
    pageTitle: "Ipê Mind Tree",
    enableSPA: true,
    enablePopovers: true,
    analytics: { provider: 'plausible' },
    locale: "pt-BR",
    baseUrl: "mindtree.ipe.city",
    ignorePatterns: ["private", "templates", ".obsidian"],
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
        header: "Schibsted Grotesk",
        body: "Source Sans Pro",
        code: "IBM Plex Mono",
      },
      colors: {
        lightMode: {
          light: "#faf8f8",
          lightgray: "#e5e5e5",
          gray: "#b8b8b8",
          darkgray: "#4e4e4e",
          dark: "#2b2b2b",
          secondary: "#284b63",
          tertiary: "#84a59d",
          highlight: "rgba(143, 159, 169, 0.15)",
        },
        darkMode: {
          light: "#161618",
          lightgray: "#393639",
          gray: "#646464",
          darkgray: "#d4d4d4",
          dark: "#ebebec",
          secondary: "#7b97aa",
          tertiary: "#84a59d",
          highlight: "rgba(143, 159, 169, 0.15)",
        },
      },
    },
  },
  plugins: {
    transformers: [
      Plugin.FrontMatter(),
      Plugin.CreatedModifiedDate({ priority: ["frontmatter", "filesystem"] }),
      Plugin.SyntaxHighlighting({ theme: { light: "github-light", dark: "github-dark" } }),
      Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }),
      Plugin.GitHubFlavoredMarkdown(),
      Plugin.TableOfContents(),
      Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }),
      Plugin.Description(),
      Plugin.Latex({ renderEngine: "katex" }),
    ],
    filters: [Plugin.RemoveDrafts()],
    emitters: [
      Plugin.AliasRedirects(),
      Plugin.ComponentResources(),
      Plugin.ContentPage(),
      Plugin.FolderPage(),
      Plugin.TagPage(),
      Plugin.ContentIndex({ enableSiteMap: true, enableRSS: true }),
      Plugin.Assets(),
      Plugin.Static(),
      Plugin.NotFoundPage(),
    ],
  },
}
```

## 3. Integração de Canvas (The "Canvas Bridge")
Quartz não renderiza `.canvas` nativamente como interativo. A solução eficiente é usar o plugin **"Webpage HTML Export"** no Obsidian e embedar o HTML gerado.

### Workflow:
1.  Instalar plugin **Webpage HTML Export** no Obsidian.
2.  Exportar Canvas desejado como "Online Web Serve" ou HTML Folder.
3.  Salvar em `quartz/content/Canvas/html/`.
4.  Criar Componente Customizado (`quartz/components/Canvas.tsx`):

```tsx
// Exemplo de estrutura para quartz/components/Canvas.tsx
import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"

export default (() => {
  const Canvas: QuartzComponent = ({ fileData }: QuartzComponentProps) => {
    // Lógica para detectar se a nota pede um canvas e qual o caminho
    const canvasPath = fileData.frontmatter?.canvas_path
    if (!canvasPath) return null

    return (
      <div class="canvas-container">
        <iframe 
          src={`/Canvas/html/${canvasPath}`} 
          style={{ width: '100%', height: '80vh', border: 'none' }}
          title="Obsidian Canvas"
        ></iframe>
      </div>
    )
  }
  return Canvas
}) satisfies QuartzComponentConstructor
```

## 4. Layout e Componentes (`quartz.layout.ts`)
Define onde os componentes aparecem.

```typescript
import { PageLayout, SharedLayout } from "./quartz/cfg"
import * as Component from "./quartz/components"

// Componentes comuns (Header, Footer)
export const sharedPageComponents: SharedLayout = {
  head: Component.Head(),
  header: [],
  afterBody: [],
  footer: Component.Footer({
    links: {
      GitHub: "https://github.com/jackyzha0/quartz",
      "Discord Community": "https://discord.gg/cRFFHYye7t",
    },
  }),
}

// Layout de páginas de conteúdo
export const defaultContentPageLayout: PageLayout = {
  beforeBody: [
    Component.Breadcrumbs(),
    Component.ArticleTitle(),
    Component.ContentMeta(),
    Component.TagList(),
  ],
  left: [
    Component.PageTitle(),
    Component.MobileOnly(Component.Spacer()),
    Component.Search(),
    Component.Darkmode(),
    Component.DesktopOnly(Component.Explorer()),
  ],
  right: [
    Component.Graph(),
    Component.DesktopOnly(Component.TableOfContents()),
    Component.Backlinks(),
  ],
}
```
