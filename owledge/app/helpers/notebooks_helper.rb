module NotebooksHelper
    
  def self.checkSortDirection(curr_col,sort_by_col)
    delimiter = "-"
    if (sort_by_col.nil? || sort_by_col.empty?)
      return curr_col+delimiter+"asc"
    end
    sort_by_arr = sort_by_col.split(delimiter)
    if sort_by_arr[0] == curr_col && sort_by_arr[1] == "asc"
      return curr_col+delimiter+"desc"
    end
    return curr_col+delimiter+"asc"
  end

end
