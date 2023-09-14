# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Send Devise's emails in background"
HOMEPAGE="https://github.com/mhfs/devise-async/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/devise-3.2"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/activerecord-3.2"
ruby_add_rdepend ">=dev-ruby/actionpack-3.2"
ruby_add_rdepend ">=dev-ruby/actionmailer-3.2"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3"
ruby_add_rdepend ">=dev-ruby/resque-1.20"
ruby_add_rdepend ">=dev-ruby/sidekiq-2.17"
ruby_add_rdepend ">=dev-ruby/delayed_job_active_record-0.3"
ruby_add_rdepend ">=dev-ruby/queue_classic-2.0"
ruby_add_rdepend ">=dev-ruby/backburner-0.4"
ruby_add_rdepend ">=dev-ruby/mocha-0.11"
ruby_add_rdepend ">=dev-ruby/torquebox-no-op-2.3"
ruby_add_rdepend ">=dev-ruby/sucker_punch-1.0.5"
ruby_add_rdepend ">=dev-ruby/que-0.8"

