require 'active_support/concern'

module UserOldFilesCompat
  extend ActiveSupport::Concern

  included do
    OLD_FILES = %i(diploma identity carte_vitale_certificate proof_of_address medical_certificate iban transport_ticket contract agent_statement request_transport_costs request_family_supplement statement_sft).freeze
    OLD_FILES.each do |field|
      mount_uploader field.to_sym, DocumentUploader, mount_on: :"old_#{field}_file_name"
    end
  end
end
