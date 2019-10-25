module JobPostingsHelper
        def action
          if action_name == 'advanced_search'
            :post
          else
            :get
          end
        end
      
        def link_to_toggle_search_modes
          if action_name == 'advanced_search'
            link_to('Go to Simple mode', job_postings_path)
          else
            link_to('Go to Advanced mode', advanced_search_job_postings_path)
          end
        end
      
        def job_posting_column_headers
          %i(id company position city description).freeze
        end
      
        def job_posting_column_fields
          %i(id company position city description).freeze
        end
      
        def results_limit
          # max number of search results to display
          10
        end
      
        def user_city_length
          # max number of characters in posts titles to display
          14
        end
      
        def user_city_header_labels
          %w(1 2 3).freeze
        end
      
        def job_posting_users
          %w(users).freeze
        end
      
        def condition_fields
          %w(fields condition).freeze
        end
      
        def value_fields
          %w(fields value).freeze
        end
      
        def display_distinct_label_and_check_box
          tag.section do
            check_box_tag(:distinct, '1', job_posting_wants_distinct_results?, class: :cbx) +
            label_tag(:distinct, 'Return distinct records')
          end
        end
      
        def job_posting_wants_distinct_results?
          params[:distinct].to_i == 1
        end
      
        def display_query_sql(job_postings)
          tag.p('SQL:') + tag.code(job_postings.to_sql)
        end
      
        def display_results_header(count)
          if count > results_limit
            "Your first #{results_limit} results out of #{count} total"
          else
            "Your #{pluralize(count, 'result')}"
          end
        end
      
        def display_sort_column_headers(search)
          job_posting_column_headers.reduce(String.new) do |string, field|
            string << (tag.th sort_link(search, field, {}, method: action))
          end 
        end
      
        def display_search_results(objects)
          objects.limit(results_limit).reduce(String.new) do |string, object|
            string << (tag.tr display_search_results_row(object))
          end
        end
      
        def display_search_results_row(object)
          job_posting_column_fields.reduce(String.new) do |string, field|
            string << (tag.td link_to(object.send(field), job_postings_path))
          end
          .html_safe +
          display_(object.users)
        end
      
        def display_(users)
          users.reduce(String.new) do |string, user|
            string << (tag.td truncate(user.city, length: user_city_length))
          end
          .html_safe
        end
end
