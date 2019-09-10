require 'spec_helper'

describe 'pe_databases::maintenance::pg_repack' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:pre_condition) { "class { 'pe_databases': }" }
      let(:facts) { os_facts }

      it { is_expected.to compile }
      context 'on PE 2019.1.0' do
        before :each do
          facts['pe_server_version'] = '2019.1.0'
          facts['pe_postgresql_info']['installed_server_version'] = 9.6
        end
        it {
          is_expected.to contain_cron('pg_repack reports tables')
            .with_command('su - pe-postgres -s /bin/bash -c "/opt/puppetlabs/server/apps/postgresql/9.6/bin/pg_repack'\
              ' -d pe-puppetdb --jobs 2 -t reports -t resource_events" > /var/log/puppetlabs/pe_databases_cron/output.log 2>&1')
        }
      end
      context 'on > PE 2019.1.0' do
        before :each do
          facts['pe_server_version'] = '2019.2.0'
          facts['pe_postgresql_info']['installed_server_version'] = 9.6
        end
        it {
          is_expected.to contain_cron('pg_repack reports tables')
            .with_command('su - pe-postgres -s /bin/bash -c "/opt/puppetlabs/server/apps/postgresql/9.6/bin/pg_repack'\
              ' -d pe-puppetdb --jobs 2 -t reports -t resource_events" > /var/log/puppetlabs/pe_databases_cron/output.log 2>&1')
        }
      end
      context 'on < PE 2019.1.0' do
        before :each do
          facts['pe_server_version'] = '2019.0.0'
          facts['pe_postgresql_info']['installed_server_version'] = 9.6
        end
        it {
          is_expected.to contain_cron('pg_repack reports tables')
            .with_command('su - pe-postgres -s /bin/bash -c "/opt/puppetlabs/server/apps/postgresql/bin/pg_repack'\
              ' -d pe-puppetdb --jobs 2 -t reports" > /var/log/puppetlabs/pe_databases_cron/output.log 2>&1')
        }
      end
      context 'on > PE 2019.1.0 with postgresql 11' do
        before :each do
          facts['pe_server_version'] = '2019.2.0'
          facts['pe_postgresql_info']['installed_server_version'] = 11
        end
        it {
          is_expected.to contain_cron('pg_repack reports tables')
            .with_command('su - pe-postgres -s /bin/bash -c "/opt/puppetlabs/server/apps/postgresql/11/bin/pg_repack'\
              ' -d pe-puppetdb --jobs 2 -t reports -t resource_events" > /var/log/puppetlabs/pe_databases_cron/output.log 2>&1')
        }
      end
    end
  end
end
