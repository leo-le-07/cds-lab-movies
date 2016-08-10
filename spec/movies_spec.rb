require 'spec_helper'

describe Movies do
  it 'has a version number' do
    expect(Movies::VERSION).not_to be nil
  end

  describe 'Search' do
    let(:search) {Movies::Search.new}

    describe '#films' do
      it 'should list movies' do
        VCR.use_cassette 'search' do
        expect(search.films).to eq [
        "Biệt Đội Cảm Tử - Suicide Squad (NC16)",
        "Vùng Nước Tử Thần - The Shallows (NC16)",
        "Siêu Điệp Viên Tái Xuất - Jason Bourne (NC16)",
"Thám Tử Lừng Danh Conan: Cơn Ác Mộng Đen Tối",
"Hồn Ma Trở Lại - The Remains (NC16)",
"The BFG - Chuyện Chưa Kể Ở Xứ Sở Khổng Lồ",
"Ác Mộng Bóng Đêm - Lights Out (NC16)",
"Big Bang MADE: The Movie",
"Mầm Chết - Viral (NC16)",
"Biệt Đội Bắt Ma 2 - Ghostbusters 2 (NC16)",
"Tik Tak, Anh Yêu Em",
"Star Trek: Không Giới Hạn - Star Trek Beyond",
"Tẩu Thoát Ngoạn Ngục - Skiptrace",
"Fan Cuồng",
"Kỷ Băng Hà: Trời Sập - Ice Age: Collision Course",
"Đẳng Cấp Thú Cưng - The Secret Life of Pets",
"Kỳ Nghỉ Hè của Nicolas - Nicolas on Holiday",
"Cặp Đôi Trái Ngược – Pas Son Genre",
"Angry Birds",
"Bệnh Viện Ma (NC16)",
"Mỹ Nhân Ngư - The Mermaid"]
      end
    end
  end
    
    describe '#agent' do
      it 'should be an instance of Mechanize' do
        expect(search.agent).to be_a Mechanize
      end
    end
    describe '#page' do
      it 'should visit website "http://123phim.vn"' do
        VCR.use_cassette 'search' do
          expect(search.page).to be_a Mechanize::Page
          expect(search.page.uri.to_s).to eq "http://www.123phim.vn/phim"
        end
      end
    end

  end
end
