#-- license
#
#  Based on original code by Justin Mecham and James Hunt
#  at http://rubyforge.org/projects/activedirectory
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#++ license

module Adtools
	module FieldType
		class MemberDnArray
			#
			# Encodes an array of objects into a list of dns
			# 
			def self.encode(obj_array)
				obj_array.collect { |obj| obj.dn }
			end

			#
			# Decodes a list of DNs into the objects that they are
			#
			def self.decode(dn_array)
				# Ensures that the objects are cast correctly
				users = User.find(:all, :distinguishedname => dn_array)
				groups = Group.find(:all, :distinguishedname => dn_array)

				arr = Array.new
				arr << users unless users.nil?
				arr << groups unless groups.nil?

				return arr.flatten
			end
		end
	end
end
