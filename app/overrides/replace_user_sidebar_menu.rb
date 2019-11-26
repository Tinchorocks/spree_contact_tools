Deface::Override.new(
  virtual_path: 'spree/admin/shared/_main_menu',
  name: 'replace_user_sidebar_menu',
  replace: "erb[silent]:contains('if Spree.user_class')",
  closing_selector: "erb[silent]:contains('end')",
  partial: 'spree/admin/shared/user_and_contact_tools'
)