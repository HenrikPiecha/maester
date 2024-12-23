// @ts-check

/** @type {import('@docusaurus/plugin-content-docs').SidebarsConfig} */
const sidebars = {
  siteSidebar: [
    "intro",
    "installation",
    {
      type: "category",
      label: "👁️‍🗨️ Monitoring with Maester",
      collapsed: false,
      collapsible: true,
      items: [{ type: "autogenerated", dirName: "monitoring" }],
    },
    {
      type: "category",
      label: "🛠️ Writing custom tests",
      collapsed: false,
      collapsible: true,
      items: [{ type: "autogenerated", dirName: "writing-tests" }],
    },
    "ca-what-if",
    "updating-tests",
    {
      type: "category",
      label: "Connect-Maester",
      collapsed: false,
      collapsible: true,
      items: [{ type: "autogenerated", dirName: "connect-maester" }],
    },
    "watch",
    "contributing",
    "faq",
    {
      type: "html",
      value: '<span class="sidebar-divider" />',
    },
    {
      type: "category",
      collapsed: false,
      label: "Tests Overview",
      link: {type: 'doc', id: 'tests/overview'},
      items: [
        {
          type: "category",
          label: "🔥 Maester",
          link: {type: 'doc', id: 'tests/maester/overview'},
          collapsed: true,
          collapsible: true,
          items: [{ type: "autogenerated", dirName: "tests/maester" }],
        },
        {
          type: "category",
          label: "🛡️ Entra ID SCA",
          link: {type: 'doc', id: 'tests/eidsca/overview'},
          collapsed: true,
          collapsible: true,
          items: [{ type: "autogenerated", dirName: "tests/eidsca" }],
        },
        {
          type: "category",
          label: "🦅 CISA",
          link: {type: 'doc', id: 'tests/cisa/overview'},
          collapsed: true,
          collapsible: true,
          items: [{ type: "autogenerated", dirName: "tests/cisa" }],
        },
        "tests/cis/overview"
      ],
    },
    {
      type: "html",
      value: '<span class="sidebar-divider" />',
    },
    {
      type: "category",
      label: "Command Reference",
      collapsed: true,
      items: [{ type: "autogenerated", dirName: "commands" }],
    },
  ],
};

export default sidebars;
