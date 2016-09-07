# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Send RPCs from Ruby using GRPC"
HOMEPAGE="https://github.com/google/grpc/tree/master/src/ruby"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/google-protobuf-3.0"
ruby_add_rdepend ">=dev-ruby/googleauth-0.5.1"
ruby_add_rdepend ">=dev-ruby/bundler-1.9"
ruby_add_rdepend ">=dev-ruby/facter-2.4"
ruby_add_rdepend ">=dev-ruby/logging-2.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.9"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0.9"
ruby_add_rdepend ">=dev-ruby/rake-compiler-dock-0.5.1"
ruby_add_rdepend ">=dev-ruby/rspec-3.2"
ruby_add_rdepend ">=dev-ruby/rubocop-0.30.0"
ruby_add_rdepend ">=dev-ruby/signet-0.7.0"

