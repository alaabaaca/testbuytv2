class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :Admin
      can :manage, Chuyen
      can :manage, Cokhungthoigian
      can :manage, Congty
      can :manage, Diemtrentuyen
      can :manage, Diquatram
      can :manage, Khungthoigian
      can :manage, Role
      can :manage, RolesUser
      can :manage, Taikhoan
      can :manage, Tramdung
      can :manage, Tuyen
      can :manage, User
    end

    if user.role? :Congty
      can :new, Chuyen
      can :show, Chuyen
      can :update, Chuyen do |chuyen|
        @congty = Congty.find_by_id(chuyen.mact)
        #
        @tkhoan = Taikhoan.find_by_tentk(user.email)
        @cty = Congty.find_by_id(@tkhoan.mact)
        #
        chuyen && @congty == @cty
      end
      can :destroy, Chuyen do |chuyen|
        @congty = Congty.find_by_id(chuyen.mact)
        #
        @tkhoan = Taikhoan.find_by_tentk(user.email)
        @cty = Congty.find_by_id(@tkhoan.mact)
        #
        chuyen && @congty == @cty
      end


      can :new, Cokhungthoigian
      can :show, Cokhungthoigian
      can :update, Cokhungthoigian do |cokhungthoigian|
        @chuyen = Chuyen.find_by_biensoxe(cokhungthoigian.biensoxe);
        @congty = Congty.find_by_id(@chuyen.mact)
        #
        @tkhoan = Taikhoan.find_by_tentk(user.email)
        @cty = Congty.find_by_id(@tkhoan.mact)
        #
        cokhungthoigian && @congty == @cty
      end
      can :destroy, Cokhungthoigian do |cokhungthoigian|
        @chuyen = Chuyen.find_by_biensoxe(cokhungthoigian.biensoxe);
        @congty = Congty.find_by_id(@chuyen.mact)
        #
        @tkhoan = Taikhoan.find_by_tentk(user.email)
        @cty = Congty.find_by_id(@tkhoan.mact)
        #
        cokhungthoigian && @congty == @cty
      end

      can :show, Khungthoigian

      can :index, Gopy
      can :show, Gopy do |gopy|
        @chuyen = Chuyen.find_by_biensoxe(gopy.biensoxe);
        @congty = Congty.find_by_id(@chuyen.mact)
        #
        @tkhoan = Taikhoan.find_by_tentk(user.email)
        @cty = Congty.find_by_id(@tkhoan.mact)
        #
        gopy && @congty == @cty
      end
      can :destroy, Gopy do |gopy|
        @chuyen = Chuyen.find_by_biensoxe(gopy.biensoxe);
        @congty = Congty.find_by_id(@chuyen.mact)
        #
        @tkhoan = Taikhoan.find_by_tentk(user.email)
        @cty = Congty.find_by_id(@tkhoan.mact)
        #
        gopy && @congty == @cty
      end


    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
