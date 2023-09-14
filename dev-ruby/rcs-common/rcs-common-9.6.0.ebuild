# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Common components for the RCS Backend"
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/log4r-1.1.9"
ruby_add_rdepend "=dev-ruby/eventmachine-1.0.3"
ruby_add_rdepend "=dev-ruby/mongoid-4.0.1"
ruby_add_rdepend ">=dev-ruby/mime-types-0"
ruby_add_rdepend ">=dev-ruby/sys-filesystem-0"
ruby_add_rdepend ">=dev-ruby/sys-cpu-0"
ruby_add_rdepend ">=dev-ruby/ffi-0"
ruby_add_rdepend ">=dev-ruby/mail-0"
ruby_add_rdepend ">=dev-ruby/sbdb-0"
ruby_add_rdepend ">=dev-ruby/yajl-ruby-0"
ruby_add_rdepend ">=dev-ruby/em-http-server-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/test-unit-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/pry-0"

