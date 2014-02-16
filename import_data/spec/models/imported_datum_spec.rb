require 'spec_helper'

describe ImportedDatum do

  subject(:imported_datum) { ImportedDatum.new }

  describe '#import' do
    context 'when the file content is in the expected format' do
      before(:each) do
        subject.stub_chain(:file, :read).and_return("purchaser name\titem description\titem price\tpurchase count\tmerchant address\tmerchant name\nSnake Plissken\t$10 off $20 of food\t10.0\t2\t987 Fake St\tBob's Pizza\nAmy Pond\t$30 of awesome for $10\t10.0\t5\t456 Unreal Rd\tTom's Awesome Shop\nMarty McFly\t$20 Sneakers for $5\t5.0\t1\t123 Fake St\tSneaker Store Emporium\nSnake Plissken\t$20 Sneakers for $5\t5.0\t4\t123 Fake St\tSneaker Store Emporium\n")
      end

      it 'should be able to return the gross revenue' do
        expect(imported_datum.import).to eq 95.0
      end
    end

    context 'when the file content is not in the expect format' do
      before(:each) do
        subject.stub_chain(:file, :read).and_return("purchaser name\titem description\titem price\tpurchase count\tmerchant address\tmerchant name\nSnake Plissken $10 off $20 of food\t10.0\t2\t987 Fake St\tBob's Pizza\nAmy Pond\t$30 of awesome for $10\t10.0 5\t456 Unreal Rd\tTom's Awesome Shop\nMarty McFly\t$20 Sneakers for $5\t5.0\t1\t123 Fake St\tSneaker Store Emporium\nSnake Plissken\t$20 Sneakers for $5\t5.0\t4\t123 Fake St\tSneaker Store Emporium\n")
      end

      it 'should return false' do
        expect(imported_datum.import).to be_false
      end
    end
  end

end

