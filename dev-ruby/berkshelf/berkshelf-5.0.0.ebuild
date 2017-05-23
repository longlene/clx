# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Manages a Cookbook's, or an Application's, Cookbook dependencies"
HOMEPAGE="http://berkshelf.com"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-2.3"
ruby_add_rdepend "<dev-ruby/berkshelf-api-client-2.0.2"
ruby_add_rdepend ">=dev-ruby/buff-config-2.0"
ruby_add_rdepend ">=dev-ruby/buff-extensions-2.0"
ruby_add_rdepend ">=dev-ruby/buff-shell_out-0.1"
ruby_add_rdepend ">=dev-ruby/cleanroom-1.0"
ruby_add_rdepend ">=dev-ruby/faraday-0.9"
ruby_add_rdepend ">=dev-ruby/httpclient-2.7"
ruby_add_rdepend ">=dev-ruby/minitar-0.5"
ruby_add_rdepend ">=dev-ruby/retryable-2.0"
ruby_add_rdepend ">=dev-ruby/ridley-5.0"
ruby_add_rdepend "<dev-ruby/solve-2.0"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/octokit-4.0"
ruby_add_rdepend ">=dev-ruby/mixlib-archive-0.1"

