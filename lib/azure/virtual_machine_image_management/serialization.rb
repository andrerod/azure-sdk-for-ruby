#-------------------------------------------------------------------------
# Copyright 2013 Microsoft Open Technologies, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#--------------------------------------------------------------------------

module Azure
  module VirtualMachineImageManagement
    module Serialization

      def self.virtual_machine_images_from_xml(imageXML)
        os_images = Array.new
        virtual_machine_images = imageXML.css('Images OSImage')
        virtual_machine_images.each do |image_node|
          image = VirtualMachineImageManagementService.new
          image.os_type = xml_content(image_node, 'OS')
          image.name = xml_content(image_node, 'Name')
          image.category = xml_content(image_node, 'Category')
          os_images << image
        end
        os_images
      end

    end
  end
end