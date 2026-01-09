return {
  "letieu/jira.nvim",
  opts = {
    -- Your setup options...
    jira = {
      -- Next fields are ignored.
      -- Use instead:
      -- export JIRA_BASE_URL="https://your-domain.atlassian.net"
      -- export JIRA_EMAIL="your-email@example.com"
      -- export JIRA_TOKEN="your-api-token"
      -- export JIRA_AUTH_TYPE="basic" # or "pat"
      base = "https://your-domain.atlassian.net", -- Base URL of your Jira instance
      email = "your-email@example.com", -- Your Jira email (Optional for PAT)
      token = "your-api-token", -- Your Jira API token or PAT
      type = "basic", -- Authentication type: "basic" (default) or "pat"
      limit = 200, -- Global limit of tasks per view (default: 200)
    },
  },
}
