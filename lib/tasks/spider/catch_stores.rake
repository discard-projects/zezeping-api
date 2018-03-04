desc "商店抓取"
task :boniu => :environment do
  pages = [1, 2, 3, 4, 5, 6, 7]
  ids = []
  # ids = ['190', '185', '187', '195', '193', '191' , '192', '188', '198', '194', '199', '201']
  # ids = ['215', '202', '210', '212', '213', '214' , '204', '208', '205', '220', '219', '221', '217', '206', '222', '227', '224', '225']
  # http://www.waimai.ph/index/store?sid=190
  pages.each do |page|
    stores_url = "http://www.waimai.ph/index/loadStores?price=&place=&open=0&sname=&page=#{page}&order=view+DESC&check=0"
    response = Faraday.get stores_url
    stores = JSON.parse(response.body)['data']
    stores.each do |store|
      next unless Store.where(name: store['sname']).blank?
      if ids.blank? || ids.include?(store['id'])
        store_url = "http://www.waimai.ph/index/stores?sid=#{store['id']}"
        logo = "http://www.waimai.ph#{store['logo']}"
        wechat_qrcode = "http://www.waimai.ph#{store['wechat']}"
        phones = [store['tel'], store['tel1'], store['tel2']]
        phones.delete('')
        store_params = {
          name: store['sname'],
          desc: store['summary'],
          remote_logo_url: logo,
          opening_at: store['openstart'],
          closing_at: store['openend'],
          address: store['address']
        }
        # p store_params
        @store = Store.new(store_params)
        Store.transaction do
          @store.save
          @store.store_detail.update({
            remote_wechat_qrcode_url: wechat_qrcode,
            qq: store['qq'],
            phones: phones
          })
          # catch_page(store_url, @store)
        end
      end
    end
  end

end

def catch_page url, store
  return unless store.id
  response = Faraday.get url
  html_doc = Nokogiri::HTML(response.body)
  html_doc.css('.goodsLis .storeList').each do |list|
    tag_text = list.at_css('.storeListTyp').content
    tag_text.gsub! "\n", ''
    tag = tag_text.rstrip
    @good_tag = Category.new(name: tag, shop: store)
    @good_tag.save
    list.css('.storeListGood').each do |goods|
      good = goods.css('.ft16')[0].content
      price = goods.css('.ft16')[1].content.split('P/').shift
      @good = Good.new(name: good, price: price, category: @good_tag, shop: store)
      @good.save
    end
  end
end
