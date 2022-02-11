module ApplicationHelper
    def get_cnt
        return GetStamp.where(student_no: current_user.student_no).count
    end
end
