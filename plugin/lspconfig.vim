lua <<EOF
require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{ on_attach=require'completion'.on_attach }
end
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_enable_snippet = 'UltiSnips'

