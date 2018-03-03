class LoadMailer < ApplicationMailer

    def active_load(load)
        @load = load
        @driver = @load.driver_user 
        @load_origin_addresses = @load.load_origin_addresses.order('created_at ASC')  
        attachments['load.pdf'] =  WickedPdf.new.pdf_from_string(
        render_to_string(
        header: { right: '[page] of [topage]' },
        template: 'loads/show_template.pdf.erb', 
        layout: 'layouts/application.pdf.erb'))
        # send_action(pdf,
        # filename: '#{@load.id}#{@load.title}.pdf',
        # type: 'application/pdf',
        # disposition: 'attachment')   
        mail(to: @load.driver_user.email,
        cc: @load.company_user.email,
        subject: "New Load Pick Up In #{@load.origin_city}")
    end
  end
  
#   load = Load.last
#   mail = LoadMailer.active_load(load) 
#   mail.deliver_now