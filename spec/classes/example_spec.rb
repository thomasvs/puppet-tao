require 'spec_helper'

describe 'tao' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|

      # this module does not support debian
      next if os.start_with?("debian")

      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "tao class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('tao::params') }
          it { is_expected.to contain_class('tao::install').that_comes_before('tao::config') }
          it { is_expected.to contain_class('tao::config') }

	  # FIXME: can we test that this package is now available?
          # it { is_expected.to contain_package('tao-release') }

	  # FIXME: shouldn't this be testable now?
          it { is_expected.to contain_yum__gpgkey('/etc/pki/rpm-gpg/RPM-GPG-KEY-tao') }
          it { is_expected.to contain_yum__repofile('tao.repo') }

        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'tao class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('tao') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
