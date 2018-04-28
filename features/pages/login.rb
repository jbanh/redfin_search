module Pages
  module LoginModal
    class << self
      def login_button
        return 'Log In'
      end

      def continue_email_button
        return 'Continue with Email'
      end

      def sign_in_button
        return 'Sign In'
      end

      def email_field
        return 'Email'
      end

      def password_field
        return 'Password'
      end

      def user_menu
        return '[data-rf-test-name="UserMenu"]'
      end
    end
  end

  module SearchFilter
    class << self
      def search_bar
        return 'City, Address, School, Agent, ZIP'
      end

      def first_search_selection
        return '[data-rf-test-name="item-row-active"]'
      end

      def filter_button
        return '[data-rf-test-id="filterButton"]'
      end

      def filter_link
        return 'Filters'
      end

      def apply_filter
        return '[data-rf-test-id="apply-search-options"]'
      end

      def min_bed_dropdown
        return '//div[@id=\'filterContent\']/div/div/div/div/div[2]/div/span/span/span/span/span'
      end

      def min_bed_select_two
        return '//div[@id=\'filterContent\']/div/div/div/div/div[2]/div/span/span/span/div/div/div/div[4]'
      end

      def min_bath_dropdown
        return '[data-rf-test-name="Stepper"]'
      end

      def min_bath_select_one_quarter
        return '//div[@id=\'filterContent\']/div/div/div/div[2]/div[2]/span/span/span[2]/div/div/div/div[3]'
      end

      def square_footage_dropdown
        return '//div[@id=\'filterContent\']/div/div[2]/div/div/div[2]/div/span/span/span/span/span'
      end

      def sqft_select_1250
        return '//div[@id=\'filterContent\']/div/div[2]/div/div/div[2]/div/span/span/span/div/div/div/div[5]/span'
      end

      def apply_search_button
        return '//div[@id=\'searchForm\']/form/div[2]/div/div/button/span'
      end
    end
  end

  module ResultTable
    class << self
      def table_view
        return 'Table'
      end

      def bedroom_column
        return '.column_4'
      end

      def bathroom_column
        return '.column_5'
      end

      def sqft_column
        return '.column_6'
      end
    end
  end
end

module Kernel
  def login_screen
    Pages::LoginModal
  end

  def search_filter
    Pages::SearchFilter
  end

  def results_table
    Pages::ResultTable
  end
end
