# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Standalone rack app to manage files onbehalf of your app"
HOMEPAGE="https://github.com/choonkeat/attache"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.6"
ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/paperclip-4.3"
ruby_add_rdepend ">=dev-ruby/puma-2.14"
ruby_add_rdepend ">=dev-ruby/net-ssh-0"
ruby_add_rdepend ">=dev-ruby/fog-1.34"
ruby_add_rdepend ">=dev-ruby/excon-0.45"
ruby_add_rdepend ">=dev-ruby/sys-filesystem-0"
ruby_add_rdepend ">=dev-ruby/disk_store-0"
ruby_add_rdepend "<dev-ruby/celluloid-0.17"
ruby_add_rdepend ">=dev-ruby/foreman-0"
ruby_add_rdepend ">=dev-ruby/connection_pool-2.2"
ruby_add_rdepend ">=dev-ruby/sidekiq-3.4"
ruby_add_rdepend ">=dev-ruby/sucker_punch-1.5"
ruby_add_rdepend ">=dev-ruby/rspec-3.2"
ruby_add_rdepend ">=dev-ruby/shoulda-3.5"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.6"

