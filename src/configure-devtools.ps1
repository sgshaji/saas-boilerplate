# configure-devtools.ps1
# Run this from inside saas-boilerplate/src

# 1. Tailwind
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

# 2. ESLint
@"
{
  "extends": ["next/core-web-vitals","plugin:@typescript-eslint/recommended"],
  "rules": { "semi":["error","always"] }
}
"@ | Out-File -Encoding UTF8 .eslintrc.json

# 3. Prettier
@"
{
  "singleQuote": true,
  "semi": true
}
"@ | Out-File -Encoding UTF8 .prettierrc

# 4. Husky & lint-staged
npm install -D husky lint-staged
npx husky install
npm pkg set scripts.prepare="husky install"
npx husky add .husky/pre-commit "npx lint-staged"
@"
{
  "*.{js,jsx,ts,tsx}": [
    "npm run lint",
    "npm run format"
  ]
}
"@ | Out-File -Encoding UTF8 lint-staged.config.json

Write-Host "✅ Dev-tools configured. Now add ‘lint’ and ‘format’ scripts to package.json."
