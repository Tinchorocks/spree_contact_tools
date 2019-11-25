Deface::Override.new(
  virtual_path: 'spree/admin/shared/_main_menu',
  name: 'replace_user_sidebar_menu',
  replace: 'ul:nth-child(14)',
  partial: 'spree/admin/shared/user_and_contact_tools'
)