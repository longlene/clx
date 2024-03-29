# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="Upload files in your Ruby applications, map them to a range of ORMs, store them on different backends"
HOMEPAGE="https://github.com/carrierwaveuploader/carrierwave"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activemodel-3.2.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.2.0"
ruby_add_rdepend ">=dev-ruby/json-1.7"
ruby_add_rdepend ">=dev-ruby/mime-types-1.16"

